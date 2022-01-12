import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/splash.entities/splash_status.dart';
import 'package:rxdart/rxdart.dart';

abstract class ActionsDelegate {
  final productOpen = PublishSubject<Product>();
  final splashShow = BehaviorSubject.seeded(SplashStatus.initial); //
}
