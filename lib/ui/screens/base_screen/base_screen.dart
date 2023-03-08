import 'dart:io';

import 'package:flutter/material.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/constants.dart';

abstract class BaseScreen extends StatefulWidget{
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<Page extends BaseScreen> extends State<Page>{
  bool get isAndroid => Platform.isAndroid;

  bool isUsingAppBar() => true;

  bool isUsingFloatingButton() => false;

  Color statusBarColor() => AppColors.white;

  Color appBarColor() => AppColors.white;

  Brightness statusBarBrightness() => Brightness.light;

  double appBarElevation() => AppConstants.noElevation;

  List<Widget> actions = [];

}