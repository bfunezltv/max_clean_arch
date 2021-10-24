import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:rxdart/src/utils/error_and_stacktrace.dart';

abstract class ActionsDelegate {
  Stream<Product> get productOpenedStream; //
  void onProductOpened(Product product);

  //
  Stream<void> get splashHiddenStream; //
  void onSplashHidden();

  //
  Stream<ErrorAndStackTrace> get loggedInErrorStream; //
  void onLoggedInError(ErrorAndStackTrace error);

  //
  Stream<void> get loggedOutStream; //
  void onLoggedOut();
}
