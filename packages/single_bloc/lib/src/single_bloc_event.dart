part of 'single_bloc.dart';

class SingleBlocEvent {
  final dynamic arguments;

  const SingleBlocEvent._(this.arguments);

  factory SingleBlocEvent.execute({dynamic arguments}) =>
      SingleBlocEvent._(arguments);
}
