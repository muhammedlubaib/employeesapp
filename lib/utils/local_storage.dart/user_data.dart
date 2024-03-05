import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

// class localStorage {
//   void storeToLocalStorage() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     Map<String, dynamic> user = {'Username': 'tom', 'Password': 'pass@123'};

//     bool result = await prefs.setString('user', jsonEncode(user));

//     String userPref = prefs.getString('user');

//     Map<String, dynamic> userMap = jsonDecode(userPref) as Map<String, dynamic>;
//   }
// }

// class LoginData {
//   final String token_type;
//   final String access_token;

//   LoginData(this.token_type, this.access_token);

//   LoginData.fromJson(Map<String, dynamic> json)
//       : token_type = json['token_type'] as String,
//         access_token = json['access_token'] as String;

//   Map<String, dynamic> toJson() => {
//         'token_type': token_type,
//         'access_token': access_token,
//       };
// }
// final prefsGlobal = SharedPreferences.getInstance();

class LocalStorage {
  static String? accessToken;

  savelocalStorage(String accessToken) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.setString('access_token', accessToken);
    // // final String? accessToken = prefs.getString('access_token') ?? '';
    // return accessToken;
  }

//  String readlocalStorage() async {
//     final prefs = await SharedPreferences.getInstance();

//     prefs.getString('access_token');
  
//   }

  removeLoginData() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('access_token');
  }
}
