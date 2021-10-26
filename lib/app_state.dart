import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:rxdart/rxdart.dart';

@singleton
class AppState {
  final lastProduct = BehaviorSubject<Product>();
  final showingSplash = BehaviorSubject.seeded(true);
}
