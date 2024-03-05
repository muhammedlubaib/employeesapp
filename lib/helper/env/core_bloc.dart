import 'dart:async';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:employeesapp/res/constants/app_constants.dart';
import 'package:employeesapp/utils/local_storage.dart/user_data.dart';
import 'package:employeesapp/view/employee_listing_screen/employee_listing_screen_view.dart';
import 'package:employeesapp/view/login/login_screen_view.dart';
import 'package:employeesapp/view/splash_screen/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

import '../../main.dart';

class CoreBloc {
  CoreRepository repository = CoreRepository();

  final uuid = const Uuid();

  Future<bool> initSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    //setting default values

    if (sharedPreferences.containsKey(AppConstants.userKey)) {
      // AppConstants.loggedUser =
      //     userModelFromJson(sharedPreferences.getString(AppConstants.userKey)!);
    }

    try {
      // DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
      // PackageInfo packageInfo = await PackageInfo.fromPlatform();
      // if (Platform.isAndroid) {
      //   AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      //   AppConstants.userAgent = {
      //     'buildType': describeEnum(Env.instance.toString()).toUpperCase(),
      //     'appName': packageInfo.appName,
      //     'deviceModel': androidInfo.model,
      //     'deviceOS': 'ANDROID',
      //     'deviceAPILevel': androidInfo.version.sdkInt,
      //     'versionCode': packageInfo.buildNumber,
      //     'versionName': packageInfo.version,
      //     'androidVersion': androidInfo.version.release,
      //   };
      // }
      // if (Platform.isIOS) {
      //   IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      //   AppConstants.userAgent = {
      //     // 'buildType': describeEnum(Env.instance.toString()).toUpperCase(),
      //     'appName': packageInfo.appName,
      //     'deviceModel': iosInfo.utsname.machine,
      //     'deviceOS': 'IOS',
      //     'versionCode': packageInfo.buildNumber,
      //     'iosVersion': iosInfo.systemVersion,
      //     'versionName': packageInfo.version
      //   };
      // }
    } catch (e) {
      //
    }
    return Future.value(true);
  }

  Future<bool> removeSharedData() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }

  // void findScreen() async {
  //   // print("12345 ${box.read(AppConstants.hidelandingScreen)}");
  //   // print("12345 ${box.read(AppConstants.token)}");
  //   if (box.read(AppConstants.hidelandingScreen) == true) {
  //     if (box.read(AppConstants.token) != null) {
  //       Navigator.pushAndRemoveUntil(
  //           globalNavigatorKey.currentContext!,
  //           CupertinoPageRoute(builder: (context) => const DashBoardScreen()),
  //           (route) => false);
  //     } else {
  //       Navigator.pushAndRemoveUntil(
  //           globalNavigatorKey.currentContext!,
  //           CupertinoPageRoute(builder: (context) => const LoginScreen()),
  //           (route) => false);
  //     }
  //   } else {
  //     Navigator.pushAndRemoveUntil(
  //         globalNavigatorKey.currentContext!,
  //         CupertinoPageRoute(builder: (context) => const LandingPage()),
  //         (route) => false);
  //   }
  // }

  void findLandingPage() async {
    final prefs = await SharedPreferences.getInstance();
    SharedPreferences preferences = await SharedPreferences.getInstance();

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
