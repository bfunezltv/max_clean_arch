import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/product.usecases/list_products_usecase.dart';
import 'package:max_clean_arch/presentation/actions/product.actions/open_product_action.dart';
import 'package:single_bloc/single_bloc.dart';

@injectable
class ProductsListBloc extends SingleBloc<KtList<Product>> {
  ProductsListBloc({
    required ListProductsUsecase listProducts,
    required OpenProductAction openProduct,
  })  : _listProducts = listProducts,
        _openProduct = openProduct,
        super(const SingleBlocState.inProgress()) {
    execute();
  }

  final ListProductsUsecase _listProducts;
  final OpenProductAction _openProduct;

  @override
  Future<KtList<Product>> action({dynamic arguments, required bool Function() isActionCanceled}) async {
    final result = await _listProducts();
    return result.fold((l) => throw (result as Left).value, (r) => r);
  }

  void openProduct(Product product) => _openProduct(product);
}
