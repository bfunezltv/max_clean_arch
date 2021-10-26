import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:max_clean_arch/app_state.dart';
import 'package:max_clean_arch/presentation/actions/actions_delegate.dart';

import 'routes.dart';

@singleton
class AppNavigator {
  AppNavigator(this._actionsDelegate, this._appState) {
    _init();
  }

  final ActionsDelegate _actionsDelegate; //
  final AppState _appState;

  final navigatorKey = GlobalKey<NavigatorState>();

  late final List<StreamSubscription> subscriptions;

  void _init() {
    subscriptions = [
      _actionsDelegate.splashHiddenStream.listen((hide) {
        navigator
          ?..popUntil((route) => false)
          ..pushNamed(AppRoutes.productsList);
      }),
      _actionsDelegate.productOpenedStream.listen((product) {
        navigator?.pushNamed(AppRoutes.productDetails, arguments: product);
      }),
    ];
  }

  NavigatorState? get navigator => navigatorKey.currentState;

  void dispose() {
    for (var subscription in subscriptions) {
      subscription.cancel();
    }
  }
}
