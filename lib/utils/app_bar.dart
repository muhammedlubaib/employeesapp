import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppbarCustom extends StatelessWidget implements PreferredSize {
  final String title;

  final List<Widget>? actions;
  bool backButtonRequired = true;
  AppbarCustom(
      {super.key,
      required this.title,
      this.actions,
      required this.backButtonRequired});

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0.5,
        shadowColor: ColorResources.GREY5,
        surfaceTintColor: Colors.white,
        backgroundColor: ColorResources.primary,
        leading: backButtonRequired
            ? CupertinoButton(
                padding: EdgeInsets.zero,
                minSize: 0,
                child: const Icon(CupertinoIcons.back),
                onPressed: () {
                  Navigator.pop(context);
                })
            : const SizedBox(),
        titleSpacing: backButtonRequired ? 0 : -30,
        centerTitle: false,
        title: Text(
          title,
          style: h4.black,
        ),
        actions: actions);
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
