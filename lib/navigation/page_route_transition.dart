import 'dart:io';

import 'package:flutter/material.dart';
import 'package:read_story/constant/constants.dart';
import 'package:read_story/enums/enums.dart';

class PageRouteTransition extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType? type;
  final PageTransitionsBuilder _iosPageTransitionBuilder =
  const CupertinoPageTransitionsBuilder();
  final PageTransitionType _typeDefault = PageTransitionType.right_to_left;
  final String? routeName;

  PageRouteTransition({required this.child, this.type, this.routeName})
      : super(
      pageBuilder: (context, animation, secondaryAnimation) => child,
      transitionDuration: AppConstants.durationNavigation,
      settings: RouteSettings(name: routeName));

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (Platform.isIOS &&
        (type ?? _typeDefault) == PageTransitionType.right_to_left) {
      return _iosPageTransitionBuilder.buildTransitions(
          this, context, animation, secondaryAnimation, child);
    }
    return _AndroidPageTransitionBuilder(
        child: child, type: type ?? _typeDefault)
        .buildTransitions(context, animation, secondaryAnimation, child);
  }
}

class _AndroidPageTransitionBuilder extends PageRouteBuilder {
  final Widget child;
  final PageTransitionType type;

  _AndroidPageTransitionBuilder({required this.child, required this.type})
      : super(pageBuilder: (context, animation, secondaryAnimation) => child);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    Offset begin; // location of x and y when start screen
    const end = Offset.zero; // location of x and y when back screen
    const curve = Curves.ease;

    switch (type) {
      case PageTransitionType.left_to_right:
        begin = Offset(-1.0, 0.0);
        break;
      case PageTransitionType.right_to_left:
        begin = Offset(1.0, 0.0);
        break;
      case PageTransitionType.top_to_bottom:
        begin = Offset(0.0, -1.0);
        break;
      case PageTransitionType.bottom_to_top:
        begin = Offset(0.0, 1.0);
        break;
    }

    final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    return SlideTransition(
      position: animation.drive(tween),
      child: child,
    );
  }
}