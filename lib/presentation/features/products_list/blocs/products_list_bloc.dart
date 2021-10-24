import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/application/product.actions/open_product_action.dart';
import 'package:max_clean_arch/application/product.usecases/list_products_usecase.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:max_clean_arch/presentation/common/simple_bloc/simple_bloc.dart';
import 'package:max_clean_arch/presentation/const.dart';

@injectable
class ProductsListBloc extends SimpleBloc<KtList<Product>> {
  ProductsListBloc({
    required ListProductsUsecase listProducts,
    required OpenProductAction openProduct,
  })  : _listProducts = listProducts,
        _openProduct = openProduct;

  final ListProductsUsecase _listProducts;
  final OpenProductAction _openProduct;

  @override
  Future<KtList<Product>> action([arguments]) async {
    final result = await _listProducts(null);
    return result.fold((l) => throw (result as Left).value, (r) => r);
  }

  @override
  void execute() {
    if (!state.inProgress) {
      add(SimpleBlocEvent.execute(minTaskTime: kMinUiTaskTime));
    }
  }

  void openProduct(Product product) => _openProduct(product);
}
