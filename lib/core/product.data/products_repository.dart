import 'package:dartz/dartz.dart';
import 'package:kt_dart/collection.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:rxdart/rxdart.dart';

abstract class ProductsRepository {
  const ProductsRepository();

  Future<Either<ErrorAndStackTrace, KtList<Product>>> list();
}
