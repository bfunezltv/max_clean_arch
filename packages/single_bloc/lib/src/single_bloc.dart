import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'single_bloc.freezed.dart'; //
part 'single_bloc_event.dart'; //
part 'single_bloc_state.dart'; //

// The 'SingleBloc' is responsible just for a single event in trying to follow the SOLID principles.
// Also, it keeps separate success and error states because sometimes we can successfully get data
// and perform an update but can get an error. In such a case we can continue showing last successfully fetch data,
// also notifying user about the error via 'Snackbar', for instance. Then we can consume the error by 'resetError()'.
//
// What's more, the SingleBloc simplifies the development process by just extending the SingleBloc class
// without need to create XxxEvent and XxxState classes.
//
// It will be helpful to take a look at the usage diagram
// https://github.com/maxeema/drawio/blob/main/SingleBloc%20usage%20diagram.drawio.png
abstract class SingleBloc<D> extends Bloc<SingleBlocEvent, SingleBlocState<D>> {
  SingleBloc([SingleBlocState<D>? initialState]) : super(initialState ?? const SingleBlocState.idle()) {
    _on();
  }

  /// The action you have to implement
  ///
  /// **[arguments] - whatever you need or don't
  ///
  /// **[isActionCanceled] - this callback is aimed to check if do we need to continue computations at our action or
  /// the result of the action will be ignored because the bloc processes a next event. If the callback return true at
  /// some point of the execution it probably the case of the "restartable()" transformer usage
  Future<D> action({dynamic arguments, required bool Function() isActionCanceled});

  final _data = BehaviorSubject<D>(); //
  ValueStream<D> get dataStream => _data; //
  D? get data => _data.valueOrNull; //
  bool get hasData => _data.hasValue && _data.value != null;

  final _error = BehaviorSubject<ErrorAndStackTrace?>(); //
  Stream<ErrorAndStackTrace> get errorStream => _error.where((event) => event != null).cast(); //
  ErrorAndStackTrace? get error => _error.valueOrNull; //
  bool get hasError => _error.hasValue && _error.value != null;

  void execute() => add(SingleBlocEvent.execute());

  _on() {
    on<SingleBlocEvent>(
      (event, emit) async {
        emit(const SingleBlocState.inProgress());
        try {
          if (emit.isDone) return;
          final result = await action(arguments: event.arguments, isActionCanceled: () => emit.isDone);
          if (emit.isDone) return;
          //
          late D data;
          if (result is Either) {
            result as Either<ErrorAndStackTrace, D>; // ensure that our either is with appropriate types
            if (result.isLeft()) {
              throw (result as Left).value;
            }
            data = result.foldRight(null, (r, _) => r)!;
          } else {
            data = result;
          }
          _error.value = null;
          _data.value = data;
          emit(SingleBlocState.completed(right(result)));
        } catch (error, stackTrace) {
          _error.value = error is ErrorAndStackTrace ? error : ErrorAndStackTrace(error, stackTrace);
          emit(SingleBlocState.completed(left(_error.value!)));
        }
      },
      // with the "restartable()" we ensure that only the latest event matter
      transformer: restartable(),
    );
  }

  void resetError() {
    _error.value = null;
  }
}
