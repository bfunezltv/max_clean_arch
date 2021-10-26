import 'package:max_clean_arch/domain/product.entities/product.dart';

abstract class ActionsDelegate {
  Stream<Product> get productOpenedStream; //
  void onProductOpened(Product product);

  //
  Stream<void> get splashHiddenStream; //
  void onSplashHidden();
}
