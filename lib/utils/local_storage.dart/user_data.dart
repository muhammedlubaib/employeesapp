import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static String? accessToken;

  savelocalStorage(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('access_token', accessToken);
  }

  removeLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}
