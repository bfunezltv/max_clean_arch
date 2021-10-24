import 'package:flutter/material.dart';
import 'package:max_clean_arch/presentation/const.dart';
import 'package:max_clean_arch/presentation/features/splash/widgets/splash_page.dart';

import 'application/splash.actions/hide_splash_action.dart';
import 'core/product.domain/product.dart';
import 'di.dart';
import 'generated/l10n.dart';
import 'presentation/features/product_details/widgets/product_details_page.dart';
import 'presentation/features/products_list/widgets/products_list_page.dart';
import 'presentation/navigator/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({this.navigatorKey, Key? key}) : super(key: key);

  final GlobalKey<NavigatorState>? navigatorKey;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      localizationsDelegates: const [
        S.delegate,
      ],
      initialRoute: Routes.splash,
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          settings: settings,
          builder: (context) {
            switch (settings.name) {
              case Routes.splash:
                return SplashPage(
                  splashImageAsset: kSplashImageAsset,
                  onFirstFrame: () => getIt<HideSplashAction>(param1: kSplashTimeout).call(),
                );
              case Routes.productsList:
                return const ProductsListPage();
              case Routes.productDetails:
                return ProductDetailsPage(product: settings.arguments as Product);
              default:
                // normally it shouldn't be happen
                return Container();
            }
          },
        );
      },
    );
  }
}
