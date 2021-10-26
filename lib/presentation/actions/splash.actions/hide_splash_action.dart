import 'package:injectable/injectable.dart';

import '../action.dart';
import '../actions_delegate.dart';

@injectable
class HideSplashAction extends Action {
  HideSplashAction(
    this.delegate,
    @factoryParam this.timeout,
  ) : assert(timeout != null);

  final ActionsDelegate delegate;
  final Duration? timeout;

  @override
  void call([_]) {
    Future.delayed(timeout!, () {
      delegate.onSplashHidden();
    });
  }
}
