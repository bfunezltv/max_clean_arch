part of 'single_bloc.dart';

@freezed
class SingleBlocState<D> with _$SingleBlocState {
  const factory SingleBlocState.idle() = _Idle; //
  const factory SingleBlocState.inProgress() = _Progress; //
  const factory SingleBlocState.completed(Either<ErrorAndStackTrace, D> either) = _Completed; //
}

extension SingleBlocStateX<D> on SingleBlocState<D> {
  bool get isIdle => this is _Idle;

  bool get inProgress => this is _Progress;

  bool get isCompleted => this is _Completed;

  bool get hasData => isCompleted && (this as _Completed).either.isRight(); //
  D get asData {
    return (this as _Completed).either.fold((_) => throw Never, (r) => r);
  }

  bool get hasError => isCompleted && (this as _Completed).either.isLeft(); //
  ErrorAndStackTrace get asError {
    return (this as _Completed).either.fold((l) => l, (_) => throw Never);
  }
}
