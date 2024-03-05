import 'dart:async';

import 'package:employeesapp/res/constants/app_constants.dart';

import 'package:employeesapp/view/employee_listing_screen/employee_listing_screen_view.dart';
import 'package:employeesapp/view/login/login_screen_view.dart';

import 'package:flutter/cupertino.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';

class CoreBloc {
  CoreRepository repository = CoreRepository();

  final uuid = const Uuid();

  Future<bool> initSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //setting default values

    if (sharedPreferences.containsKey(AppConstants.userKey)) {}

    try {} catch (e) {
      //
    }
    return Future.value(true);
  }

  Future<bool> removeSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }

  void findLandingPage() async {
    final prefs = await SharedPreferences.getInstance();


    if (prefs.getString(AppConstants.userKey) != null) {
      //dashboard
      Navigator.pushAndRemoveUntil(
          globalNavigatorKey.currentContext!,
          CupertinoPageRoute(
              builder: (context) => const EmployeelistingScreenView()),
          (route) => false);
    } else {
      //login
      Navigator.pushAndRemoveUntil(
          globalNavigatorKey.currentContext!,
          CupertinoPageRoute(builder: (context) => const LoginScreen()),
          (route) => false);
    }
  }

  Future<String?> getImageUrl(String path) async {
    if (path.isEmpty) return '';
    return repository.getImageUrl(path);
  }
}

class CoreRepository {
  Future<String?> getImageUrl(String path) async {
    try {
      return Future.value('');
    } catch (e) {
      return null;
    }
  }
}
