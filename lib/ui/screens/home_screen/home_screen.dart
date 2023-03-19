import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:read_story/config/config.dart';
import 'package:read_story/constant/app_constants.dart';
import 'package:read_story/models/models.dart';
import 'package:read_story/ui/screens/base_screen/base_screen.dart';

class HomeScreen extends BaseScreen {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends BaseScreenState<HomeScreen> with Screen{

  late Box<Category> _categoryBox;
  late Box<Story> _storyBox;

  @override
  void initState() {
    super.initState();
    _categoryBox = Hive.box(AppConstants.category_box);
    _storyBox = Hive.box(AppConstants.story_box);
    // for(int i = 0; i < _storyBox.length; i++){
    //   print(_storyBox.getAt(i)!.chapters![0].chapterTitle);
    // }
  }

  @override
  Widget appBarTitle() {
    return Text(appString.app_name, style: AppStyles.textLexend());
  }

  @override
  bool isUsingLeadingWidget() => false;

  @override
  Widget body() {
    return Container();
  }
}
