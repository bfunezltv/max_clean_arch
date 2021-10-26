import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:max_clean_arch/di.dart';
import 'package:max_clean_arch/domain/product.entities/product.dart';
import 'package:max_clean_arch/presentation/actions/splash.actions/hide_splash_action.dart';
import 'package:max_clean_arch/presentation/const.dart';
import 'package:max_clean_arch/presentation/features/product_details/widgets/product_details_page.dart';
import 'package:max_clean_arch/presentation/features/products_list/widgets/products_list_page.dart';
import 'package:max_clean_arch/presentation/features/splash/widgets/splash_page.dart';

import 'routes.dart';

class AppRouteFactory {
  Route<dynamic> call(RouteSettings settings) {
    return MaterialPageRoute(
      settings: settings,
      builder: (context) {
        switch (settings.name) {
          case AppRoutes.splash:
            return SplashPage(
              splashImageAsset: kSplashImageAsset,
              onFirstFrame: getIt<HideSplashAction>(param1: kSplashTimeout),
            );
          case AppRoutes.productsList:
            return const ProductsListPage();
          case AppRoutes.productDetails:
            return ProductDetailsPage(product: settings.arguments as Product);
          default:
            // normally it shouldn't be happen
            return Container();
        }
      },
    );
  }
}
