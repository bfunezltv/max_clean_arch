import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/core/product.data/products_repository.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:rxdart/rxdart.dart';

import 'fake_product_converter.dart';
import 'fake_products_data_source.dart';

@Injectable(as: ProductsRepository)
class FakeProductsRepository extends ProductsRepository {
  const FakeProductsRepository({required this.dataSource});

  final FakeProductsDataSource dataSource;

  @override
  Future<Either<ErrorAndStackTrace, KtList<Product>>> list() async {
    try {
      final result = await dataSource.list();
      final products = result.map(FakeProductMapper.toDomain);
      final shuffled = products.asList()..shuffle();
      return right(KtList.from(shuffled));
    } catch (error, stackTrace) {
      return left(ErrorAndStackTrace(error, stackTrace));
    }
  }
}
