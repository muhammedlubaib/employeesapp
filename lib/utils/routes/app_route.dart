// ignore_for_file: unreachable_switch_case

import 'package:employeesapp/models/contact_model.dart';
import 'package:employeesapp/res/log_info.dart';
import 'package:employeesapp/view/add_employee_screen/add_employee_screen_view.dart';
import 'package:employeesapp/view/employee_details_screen/employee_details_screen_view.dart';
import 'package:employeesapp/view/employee_listing_screen/employee_listing_screen_view.dart';
import 'package:employeesapp/view/login/login_screen_view.dart';
import 'package:employeesapp/view/splash_screen/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    logInfo(settings.name);
    Uri uri = Uri.parse(settings.name ?? "");
    switch (uri.path) {
      case SplashScreen.path:
        return pageRoute(settings, const SplashScreen());
      case LoginScreen.path:
        return pageRoute(settings, const LoginScreen());
      case EmployeeDetailScreenView.path:
        final args = settings.arguments as EmployeeModel;
        return pageRoute(
            settings,
            EmployeeDetailScreenView(
              data: args,
            ));
      case EmployeelistingScreenView.path:
        return pageRoute(settings, const EmployeelistingScreenView());
      case AddEmployeeScreenView.path:
        return pageRoute(settings, const AddEmployeeScreenView());
      default:
        return pageRoute(settings, const Scaffold());
    }
  }

  static CupertinoPageRoute<dynamic> pageRoute(
      RouteSettings settings, Widget screen) {
    return CupertinoPageRoute(
      settings: settings,
      builder: (context) => screen,
    );
  }
}
