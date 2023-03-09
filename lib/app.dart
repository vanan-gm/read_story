import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:read_story/settings/settings.dart';
import 'package:read_story/ui/screens/screens.dart';

class MyApp extends StatefulWidget {

  static void setLocale({
    required BuildContext context,
    required String languageCode,
    required String languageName,
    VoidCallback? onSuccess,
  }) {
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    if (languageCode != AppPreferences.languageCode) {
      state!.setLocale(languageCode);
      AppPreferences.languageCode = languageCode;
      AppPreferences.languageName = languageName;
    }
    onSuccess?.call();
  }

  static void initLocale(BuildContext context){
    if (AppPreferences.languageCode.isEmpty || AppPreferences.languageName.isEmpty) {
      AppPreferences.languageCode = 'en';
      AppPreferences.languageName = 'English';
    }
    _MyAppState? state = context.findAncestorStateOfType<_MyAppState>();
    print(AppPreferences.languageCode);
    state!.setLocale(AppPreferences.languageCode);
    print('Done');
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;
  setLocale(String languageCode) => setState(() => _locale = Locale(languageCode));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Read Story Application',
      debugShowCheckedModeBanner: false,
      locale: _locale ?? Locale('en'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SplashScreen(),
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode)
            return supportedLocale;
        }
        return supportedLocales.first;
      },
    );
  }
}
