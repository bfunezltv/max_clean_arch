import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/core/product.domain/product.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AppState {
  final lastProduct = BehaviorSubject<Product>();
  final showingSplash = BehaviorSubject.seeded(true);
}
