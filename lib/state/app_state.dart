import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/splash.entities/splash_status.dart';

part 'app_state.freezed.dart';

typedef ProductId = String;

@freezed
class AppStateInfo with _$AppState {
  const factory AppStateInfo({
    ProductId? lastProductId,
  }) = _AppState;
}