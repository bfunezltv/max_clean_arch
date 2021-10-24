import 'dart:core';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:max_clean_arch/presentation/common/min_exec_time_task.dart';
import 'package:rxdart/rxdart.dart';

part 'simple_bloc.freezed.dart'; //
part 'simple_bloc_event.dart'; //
part 'simple_bloc_state.dart'; //

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
    });
  }

  void resetError() {
    _error.value = null;
  }
}
