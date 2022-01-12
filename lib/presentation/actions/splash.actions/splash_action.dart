import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/domain/splash.entities/splash_status.dart';

import '../action.dart';
import '../actions_delegate.dart';

@injectable
class ShowSplashAction extends Action {
  const ShowSplashAction(
    this.delegate,
    @factoryParam this.timeout,
  ) : assert(timeout != null);

  final ActionsDelegate delegate;
  final Duration? timeout;

  @override
  void call([_]) {
    delegate.splashShow.add(SplashStatus.showing);
    Future.delayed(timeout!, () {
      delegate.splashShow.add(SplashStatus.finished);
    });
  }
}
