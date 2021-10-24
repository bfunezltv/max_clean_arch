part of 'simple_bloc.dart';

class SimpleBlocEvent {
  final Duration? minTaskTime;
  final dynamic arguments;

  const SimpleBlocEvent._(this.minTaskTime, this.arguments);

  factory SimpleBlocEvent.execute({Duration? minTaskTime, dynamic arguments}) =>
      SimpleBlocEvent._(minTaskTime, arguments);
}
