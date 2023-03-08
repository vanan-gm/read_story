import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/constants.dart';
import 'package:read_story/ui/widgets/widgets.dart';

abstract class BaseScreen extends StatefulWidget{
  const BaseScreen({Key? key}) : super(key: key);
}

abstract class BaseScreenState<Page extends BaseScreen> extends State<Page>{
  bool get isAndroid => Platform.isAndroid;

  Color backgroundColor() => AppColors.white;

  bool isUsingAppBar() => true;

  Widget appBarTitle() => Text('Undefined', style: AppStyles.textLexend());

  bool isCenterAppBar() => true;

  bool isUsingFloatingButton() => false;

  Widget floatingButton() => FloatingActionButton(
    onPressed: (){},
    elevation: AppConstants.noElevation,
    backgroundColor: AppColors.blue,
    child: Icon(Icons.add, color: AppColors.white),
  );

  Color statusBarColor() => AppColors.white;

  Color appBarColor() => AppColors.white;

  Brightness statusBarBrightness() => Brightness.light;

  double appBarElevation() => AppConstants.noElevation;

  List<Widget> actions() => [];

  bool isUsingLeadingWidget() => true;

  Color leadingWidgetColor() => AppColors.black;

  Widget leadingWidget() => RippleEffect(
    onPressed: () => Navigator.of(context).maybePop(),
    child: Icon(
      isAndroid ? Icons.keyboard_backspace_rounded : CupertinoIcons.back,
      color: leadingWidgetColor(),
    ),
  );

  void initStateBase() => (){};
  void disposeStateBase() => (){};
}

mixin Screen<Page extends BaseScreen> on BaseScreenState<Page>{
  late double width;
  late double height;

  @override
  void initState() {
    super.initState();
    initStateBase();
  }

  @override
  void dispose() {
    super.dispose();
    disposeStateBase();
  }

  Widget body();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: isUsingAppBar() ? Scaffold(
        backgroundColor: backgroundColor(),
        appBar: AppBar(
          title: appBarTitle(),
          backgroundColor: appBarColor(),
          centerTitle: isCenterAppBar(),
          leading: isUsingLeadingWidget() ? leadingWidget() : null,
          elevation: appBarElevation(),
          actions: actions(),
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: statusBarColor(),
            statusBarBrightness: statusBarBrightness(),
          ),
        ),
        body: SafeArea(
          child: body()
        ),
        floatingActionButton: isUsingFloatingButton() ? floatingButton() : null,
      ) : AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: statusBarColor(),
          statusBarBrightness: statusBarBrightness(),
        ),
        child: Scaffold(
          backgroundColor: backgroundColor(),
          body: SafeArea(
            child: body(),
          ),
          floatingActionButton: isUsingFloatingButton() ? floatingButton() : null,
        ),
      ),
    );
  }
}