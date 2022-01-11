import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:max_clean_arch/presentation/common/min_exec_time_task.dart';
import 'package:rxdart/rxdart.dart';

part 'simple_bloc.freezed.dart'; //
part 'simple_bloc_event.dart'; //
part 'simple_bloc_state.dart'; //

// The 'SimpleBloc' is responsible just for a single event in trying to follow the SOLID principles.
// Also, it keeps separate success and error states because sometimes we can successfully get data
// and perform an update but can get an error. In such a case we can continue showing last successfully fetch data,
// also notifying user about the error via 'Snackbar', for instance. Then we can consume the error by 'resetError()'.
//
// What's more, the SimpleBloc simplifies the development process by just extending the SimpleBloc class
// without need to write XxxEvent and XxxState classes.
//
// It will be helpful to take a look at the usage diagram
// https://github.com/maxeema/drawio/blob/main/SimpleBloc%20usage%20diagram.png
abstract class SimpleBloc<D> extends Bloc<SimpleBlocEvent, SimpleBlocState<D>> {
  SimpleBloc() : super(const SimpleBlocState.idle()) {
    _on();
  }

  Future<D> action([dynamic arguments]);

  final _data = BehaviorSubject<D>(); //
  ValueStream<D> get dataStream => _data; //
  D? get data => _data.valueOrNull; //
  bool get hasData => _data.hasValue && _data.value != null;

  final _error = BehaviorSubject<ErrorAndStackTrace?>(); //
  Stream<ErrorAndStackTrace> get errorStream => _error.where((event) => event != null).cast(); //
  ErrorAndStackTrace? get error => _error.valueOrNull; //
  bool get hasError => _error.hasValue && _error.value != null;

  void execute() {
    if (!state.inProgress) {
      add(SimpleBlocEvent.execute());
    }
  }

  _on() {
    on<SimpleBlocEvent>((event, emit) async {
      emit(const SimpleBlocState.inProgress());
      try {
        final result = await MinExecTimeTask<D>(
          minDelay: event.minTaskTime ?? Duration.zero,
          compute: () => action(event.arguments),
        ).start();
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
        emit(SimpleBlocState.completed(right(result)));
      } catch (error, stackTrace) {
        _error.value = error is ErrorAndStackTrace ? error : ErrorAndStackTrace(error, stackTrace);
        emit(SimpleBlocState.completed(left(_error.value!)));
      }
    }, transformer: restartable());
  }

  void resetError() {
    _error.value = null;
  }
}
