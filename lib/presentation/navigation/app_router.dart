import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/di.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/domain/splash.entities/splash_status.dart';
import 'package:max_clean_arch/presentation/actions/actions_delegate.dart';
import 'package:max_clean_arch/presentation/actions/splash.actions/splash_action.dart';
import 'package:max_clean_arch/presentation/const.dart';
import 'package:max_clean_arch/presentation/features/product_details/widgets/product_details_page.dart';
import 'package:max_clean_arch/presentation/features/products_list/widgets/products_list_page.dart';
import 'package:max_clean_arch/presentation/features/splash/widgets/splash_page.dart';
import 'package:max_clean_arch/presentation/generated/assets.gen.dart';
import 'package:max_clean_arch/state/app_state_manager.dart';

import 'app_routes.dart';

const _initialLocation = AppRoutes.productsList;

@injectable
class AppRouter extends GoRouter {
  final ActionsDelegate _actionsDelegate; //
  final AppStateManager _appStateManager;

  AppRouter(this._actionsDelegate, this._appStateManager)
      : super(
          refreshListenable: Listenable.merge([
            //  _appStateManager,
            GoRouterRefreshStream(_actionsDelegate.splashShow),
          ]),
          redirect: (state) {
// print('ddd redirect() state: ${state.params}, ${state.extra}, ${_actionsDelegate.splashShow}/${_actionsDelegate.splashShow}');
// print('state.fullpath: ${state.fullpath}, ${state.path}, ${state.location}, ${state.subloc}, _appStateManager: ${_appStateManager.state}');
            if (state.subloc != AppRoutes.splash && _actionsDelegate.splashShow.value != SplashStatus.finished) {
              var splashLoc = AppRoutes.splash;
              if (state.subloc != '/') {
                splashLoc += '?from=${state.subloc}';
              }
              return splashLoc;
            }
            if (state.subloc == AppRoutes.splash && _actionsDelegate.splashShow.value == SplashStatus.finished) {
              final from = state.queryParams['from'];
              return from ?? _initialLocation;
            }
            return null;
          },
          initialLocation: _initialLocation,
          routes: [
            GoRoute(
              path: AppRoutes.splash,
              pageBuilder: (context, state) {
                return MaterialPage(
                    key: state.pageKey,
                    child: SplashPage(
                      splashImage: Assets.splash.shoppingSplash,
                      onFirstFrame: getIt<ShowSplashAction>(param1: kSplashTimeout),
                    ));
              },
            ),
            GoRoute(
              path: AppRoutes.productsList,
              pageBuilder: (context, state) {
                return MaterialPage(
                  key: state.pageKey,
                  child: const ProductsListPage(),
                );
              },
              routes: [
                GoRoute(
                  path: AppRoutes.productDetails,
                  pageBuilder: (context, state) {
                    return MaterialPage(
                      key: state.pageKey,
                      child: ProductDetailsPage(product: state.extra as Product),
                    );
                  },
                ),
              ]
            ),
          ],
        ) {
    //
    _init();
  }

  late final List<StreamSubscription> _subscriptions;

  void _init() {
    _subscriptions = [
      _actionsDelegate.productOpen.listen((product) {
        go('${AppRoutes.productsList}/${AppRoutes.productDetails}', extra: product);
      }),
    ];
  }

  @override
  void dispose() {
    for (var subscription in _subscriptions) {
      subscription.cancel();
    }
    super.dispose();
  }
}
