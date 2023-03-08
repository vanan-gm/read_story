import 'package:flutter/material.dart';
import 'package:read_story/enums/enums.dart';
import 'package:read_story/navigation/navigation.dart';

class AppNavigator {
  AppNavigator._();

  static Future<dynamic> push({
    required BuildContext context,
    required Widget page,
    bool useRootNavigator = false,
    PageTransitionType? pageTransitionType,
    String? routeName,
  }) {
    Route pageRoute = PageRouteTransition(
        child: page,
        type: pageTransitionType,
        routeName: routeName);
    return Navigator.of(context, rootNavigator: useRootNavigator)
        .push(pageRoute);
  }

  static Future<dynamic> pushAndClear({
    required BuildContext context,
    required Widget page,
    PageTransitionType? pageTransitionType,
  }) {
    Route pageRoute = PageRouteTransition(
        child: page,
        type: pageTransitionType);

    return Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(pageRoute, (route) => false);
  }

  static Future<dynamic> pushReplacement({
    required BuildContext context,
    required Widget page,
    PageTransitionType? pageTransitionType,
  }) {
    Route pageRoute = PageRouteTransition(
        child: page,
        type: pageTransitionType);

    return Navigator.of(context, rootNavigator: true)
        .pushReplacement(pageRoute);
  }

  static Future<dynamic> pushAndRemoveUntil({
    required BuildContext context,
    required Widget page,
    PageTransitionType? pageTransitionType,
  }) {
    Route pageRoute = PageRouteTransition(
        child: page,
        type: pageTransitionType);

    return Navigator.of(context, rootNavigator: true)
        .pushAndRemoveUntil(pageRoute, (route) => false);
  }
}