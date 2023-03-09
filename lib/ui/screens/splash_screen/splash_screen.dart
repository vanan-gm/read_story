import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:read_story/app.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/ui/screens/base_screen/base_screen.dart';

class SplashScreen extends BaseScreen {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends BaseScreenState<SplashScreen> with Screen{

  @override
  bool isUsingAppBar() => false;

  @override
  void buildUICompleted() {
    super.buildUICompleted();
    MyApp.initLocale(context);
  }

  @override
  Widget body() {
    return Container(
      width: width,
      height: height,
      color: AppColors.white,
      child: Lottie.asset('assets/lotties/lottie_reading.json', height: width * .5, width: width * .5),
    );
  }

}
