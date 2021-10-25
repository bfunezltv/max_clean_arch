import 'package:flutter/material.dart';

import 'generated/l10n.dart';
import 'presentation/navigator/app_route_factory.dart';
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
      initialRoute: AppRoutes.splash,
      onGenerateRoute: AppRouteFactory(),
    );
  }
}
