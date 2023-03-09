import 'package:read_story/constant/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences{
  static late AppPreferences _appPreferences;
  static late SharedPreferences _sharedPreferences;

  static Future<AppPreferences> init() async{
    _sharedPreferences = await SharedPreferences.getInstance();
    _appPreferences = AppPreferences();
    return _appPreferences;
  }

  static String get languageCode => _get<String>(AppConstants.language_code);

  static String get languageName => _get<String>(AppConstants.language_name);

  static set languageCode(String languageCode) => _put(AppConstants.language_code, languageCode);

  static set languageName(String languageName) => _put(AppConstants.language_name, languageName);

  /// Put method for SharedPreferences
  static Future<void> _put<T>(String key, dynamic value) async{
    switch(T){
      case String:
        await _sharedPreferences.setString(key, value);
        break;
      case bool:
        await _sharedPreferences.setBool(key, value);
        break;
      case int:
        await _sharedPreferences.setInt(key, value);
        break;
      case double:
        await _sharedPreferences.setDouble(key, value);
        break;
    }
  }

  /// Get method for SharedPreferences
  static T _get<T>(String key){
    dynamic result;
    switch(T){
      case String:
        result = _sharedPreferences.getString(key) ?? '';
        break;
      case bool:
        result = _sharedPreferences.getBool(key) ?? false;
        break;
      case int:
        result = _sharedPreferences.getInt(key) ?? 1;
        break;
      case double:
        result = _sharedPreferences.getDouble(key) ?? -1;
        break;
    }
    return result as T;
  }
}