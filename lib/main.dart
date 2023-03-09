import 'package:flutter/material.dart';
import 'package:read_story/app.dart';
import 'package:read_story/settings/settings.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await AppPreferences.init();
  runApp(AppStart());
}

class AppStart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}
