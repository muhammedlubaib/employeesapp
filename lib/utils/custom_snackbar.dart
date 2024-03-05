import 'package:employeesapp/main.dart';
import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SnackBarCustom {
  static void success(String string,
      {String? title, required BuildContext context}) {
    HapticFeedback.selectionClick();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0.6,
        backgroundColor: ColorResources.PRIMARY,
        action: SnackBarAction(
            textColor: ColorResources.WHITE,
            label: title ?? "Dismiss",
            onPressed: () {}),
        content: Text(
          string,
          style: body1.white,
        ),
      ),
    );
  }

  static void successView(String string, {String? title}) {
    HapticFeedback.selectionClick();
    ScaffoldMessenger.of(globalNavigatorKey.currentContext!).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0.6,
        backgroundColor: ColorResources.PRIMARY,
        action: SnackBarAction(
            textColor: ColorResources.WHITE,
            label: title ?? "View",
            onPressed: () {
              // Navigator.pushNamed(context, routeName)
            }),
        content: Text(
          string,
          style: body1.white,
        ),
      ),
    );
  }

  static void successnew(String string, BuildContext context) {
    HapticFeedback.lightImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0.6,
        backgroundColor: ColorResources.WHITE,
        action: SnackBarAction(
            textColor: ColorResources.GREEN,
            label: "Dismiss",
            onPressed: () {}),
        content: Text(
          string,
          style: body1.green,
        ),
      ),
    );
  }

  static void error(String string, BuildContext context) {
    HapticFeedback.heavyImpact();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        elevation: 0.6,
        backgroundColor: ColorResources.RED,
        action: SnackBarAction(
            textColor: ColorResources.WHITE,
            label: "Dismiss",
            onPressed: () {}),
        content: Text(
          string,
          style: body1.copyWith(color: ColorResources.WHITE),
        ),
      ),
    );
  }
}


// ScaffoldMessenger.of(context).showSnackBar(
        // SnackBar(
        //   behavior: SnackBarBehavior.floating,
        //   elevation: 0.6,
        //   backgroundColor: ColorResources.PRIMARY,
        //   action: SnackBarAction(
        //       textColor: ColorResources.WHITE,
        //       label: "Dismiss",
        //       onPressed: () {}),
        //   content: Text(
        //     e.toString(),
        //     style: body1.white,
        //   ),
        // ),
      // );