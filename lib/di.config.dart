// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'app_actions_delegate.dart' as _i8;
import 'app_state.dart' as _i3;
import 'application/actions_delegate.dart' as _i7;
import 'application/product.actions/open_product_action.dart' as _i12;
import 'application/product.data.impl/fake_products_data_source.dart' as _i4;
import 'application/product.data.impl/fake_products_repository.dart' as _i6;
import 'application/product.usecases/list_products_usecase.dart' as _i11;
import 'application/splash.actions/hide_splash_action.dart' as _i10;
import 'core/product.data/products_repository.dart' as _i5;
import 'presentation/features/products_list/blocs/products_list_bloc.dart'
    as _i13;
import 'presentation/navigator/app_navigator.dart'
    as _i9; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.AppState>(_i3.AppState());
  gh.factory<_i4.FakeProductsDataSource>(() => _i4.FakeProductsDataSource());
  gh.factory<_i5.ProductsRepository>(() => _i6.FakeProductsRepository(
      dataSource: get<_i4.FakeProductsDataSource>()));
  gh.singleton<_i7.ActionsDelegate>(
      _i8.AppActionsDelegate(get<_i3.AppState>()));
  gh.singleton<_i9.AppNavigator>(
      _i9.AppNavigator(get<_i7.ActionsDelegate>(), get<_i3.AppState>()));
  gh.factoryParam<_i10.HideSplashAction, Duration?, dynamic>((timeout, _) =>
      _i10.HideSplashAction(get<_i7.ActionsDelegate>(), timeout));
  gh.factory<_i11.ListProductsUsecase>(
      () => _i11.ListProductsUsecase(get<_i5.ProductsRepository>()));
  gh.factory<_i12.OpenProductAction>(
      () => _i12.OpenProductAction(get<_i7.ActionsDelegate>()));
  gh.factory<_i13.ProductsListBloc>(() => _i13.ProductsListBloc(
      listProducts: get<_i11.ListProductsUsecase>(),
      openProduct: get<_i12.OpenProductAction>()));
  return get;
}
