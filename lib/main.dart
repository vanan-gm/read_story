import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:read_story/app.dart';
import 'package:read_story/constant/app_constants.dart';
import 'package:read_story/models/models.dart';
import 'package:read_story/settings/settings.dart';
import 'package:path_provider/path_provider.dart' as path;

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  final dir = await path.getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.initFlutter(AppConstants.collection_name);
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ChapterAdapter());
  Hive.registerAdapter(StoryAdapter());
  await Hive.openBox<Category>(AppConstants.category_box);
  await Hive.openBox<Story>(AppConstants.story_box);
  runApp(AppStart());
}

class AppStart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
