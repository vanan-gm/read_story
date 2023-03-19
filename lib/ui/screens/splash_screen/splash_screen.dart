import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/app_constants.dart';
import 'package:read_story/models/category/category.dart';
import 'package:read_story/models/chapter/chapter.dart';
import 'package:read_story/models/models.dart';
import 'package:read_story/navigation/app_navigation.dart';
import 'package:read_story/settings/settings.dart';
import 'package:read_story/ui/screens/base_screen/base_screen.dart';
import 'package:read_story/ui/screens/home_screen/home_screen.dart';

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
    // MyApp.initLocale(context);
  }
  
  @override
  void initState() {
    super.initState();
    _insertHiveData();
    _delayAndNavigate();
  }
  
  void _delayAndNavigate(){
    Future.delayed(Duration(seconds: 2), (){
      AppNavigator.pushAndRemoveUntil(context: context, page: HomeScreen());
    });
  }

  Future<void> _insertHiveData() async{
    // if(!AppPreferences.saveHiveData){
    //
    //   AppPreferences.saveHiveData = true;
    // }else{
    //   print('Done');
    // }
    _insertCategory();
    _insertStory();
  }

  Future<void> _insertCategory() async{
    final Box<Category> categoryBox = Hive.box(AppConstants.category_box)..clear();
    final data = await rootBundle.loadString('assets/jsons/categories.json');
    final result = json.decode(data) as List<dynamic>;
    for(var item in result){
      final dat = await rootBundle.load(item['image']);
      final bytes = dat.buffer.asUint8List();
      categoryBox.add(Category(id: item['id'], name: item['name'], image: bytes));
    }
  }

  Future<void> _insertStory() async{
    final Box<Story> storyBox = Hive.box(AppConstants.story_box)..clear();
    final data = await rootBundle.loadString('assets/jsons/stories.json');
    final result = json.decode(data) as List<dynamic>;
    for(var item in result){
      final dat = await rootBundle.load(item['image']);
      final bytes = dat.buffer.asUint8List();
      storyBox.add(Story(id: item['id'], name: item['name'], image: bytes, description: item['description'],
        categoryId: item['categoryId'], chapters: item['chapters'].map((i) => Chapter.fromJson(i)).toList(), createdAt: item['createdAt']));
    }
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
