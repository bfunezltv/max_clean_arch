import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/application/actions_delegate.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:rxdart/rxdart.dart';

import 'app_state.dart';

@Singleton(as: ActionsDelegate)
class AppActionsDelegate extends ActionsDelegate {
  AppActionsDelegate(this.appState) {
    _init();
  }

  final AppState appState;

  void _init() {
    productOpenedStream.pipe(appState.lastProduct);
    splashHiddenStream.map((event) => false).pipe(appState.showingSplash);
    // Rx.concat([loggedInStream, loggedOutStream.map((event) => const AuthInfo.unknown())]).pipe(appState.authInfo);
  }

  @override
  final Stream<Product> productOpenedStream = PublishSubject(); //
  @override
  void onProductOpened(Product product) => (productOpenedStream as Subject).add(product);

  @override
  final Stream<void> splashHiddenStream = PublishSubject(); //
  @override
  void onSplashHidden() => (splashHiddenStream as Subject).add(null);

  @override
  final Stream<ErrorAndStackTrace> loggedInErrorStream = PublishSubject(); //
  @override
  void onLoggedInError(ErrorAndStackTrace error) => (loggedInErrorStream as Subject).add(error);

  @override
  final Stream<void> loggedOutStream = PublishSubject(); //
  @override
  void onLoggedOut() => (loggedOutStream as Subject).add(null);
}
