import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';

import '../action.dart';
import '../actions_delegate.dart';

@injectable
class OpenProductAction implements Action {
  const OpenProductAction(
    this.delegate,
  );

  final ActionsDelegate delegate;

  @override
  void call([covariant Product? product]) => delegate.onProductOpened(product!);
}
