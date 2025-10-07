import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static late SharedPreferences sharedPreferences;
  LocalStorage._();
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    print("pres is defined");
  }

  static Future<void> saveToken(String token) async {
    await sharedPreferences.setString('token', token);
  }

  static String? get token => sharedPreferences.getString('token');


  static Future<void> saveGithubToken(String token) async {
    await sharedPreferences.setString('githubToken', token);
  }

  static String? get githubToken => sharedPreferences.getString('githubToken');
}