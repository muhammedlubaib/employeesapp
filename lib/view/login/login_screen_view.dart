// ignore_for_file: unnecessary_null_comparison

import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';

import 'package:employeesapp/utils/general_utilis.dart';

import 'package:employeesapp/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const String path = "/";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();
  final loginFormkey = GlobalKey<FormState>();

  LoginProvider controller({required bool uiRender}) =>
      Provider.of(context, listen: uiRender);
  @override
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              height: h / 3,
              margin: const EdgeInsets.symmetric(horizontal: padding26),
              width: w,
              child: RichText(
                textAlign: TextAlign.left, // Align text to the left
                text: TextSpan(
                  style: TextStyle(
                    color: ColorResources.textColor,
                    fontSize: h * 0.025, // Responsive font size
                  ),
                  children: [
                    TextSpan(
                        text: 'Welcome Back\n',
                        style: h1.copyWith(fontSize: w * 0.070)),
                    TextSpan(
                        text: 'Please login into your account',
                        style: subHeading.copyWith(fontSize: w * 0.035)),
                  ],
                ),
              ),
            ),
            Container(
              height: h / 1,
              padding: const EdgeInsets.symmetric(horizontal: padding26),
              decoration: const BoxDecoration(
                color: ColorResources.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(32),
                  topRight: Radius.circular(32),
                ),
              ),
              child: Form(
                key: loginFormkey,
                child: Column(
                  children: [
                    gap21,
                    gapXL,
                    TextFieldCustom(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: userName,
                      prefixWidget: const Icon(
                        Icons.mail_outline_rounded,
                        color: ColorResources.textColor,
                      ),
                      hintText: "Username",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter User Name";
                        }
                        return null;
                      },
                    ),
                    gap21,
                    TextFieldCustom(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // keyboardType: TextInputType.name,
                      controller: password,
                      obscure: true,
                      prefixWidget: const Icon(
                        Icons.key,
                        color: ColorResources.textColor,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        if (value.length < 4) {
                          return "Please enter atleast 5 Character";
                        }
                        return null;
                      },
                      hintText: "Password",
                    ),
                    gapXL,
                    Consumer<LoginProvider>(builder: (context, controllers, _) {
                      return SubmitButton(
                        showLoader: controllers.loginloading,
                        isEnabled: checkData(),
                        //loginFormkey.currentState?.validate(),
                        "Sign in",
                        onTap: (value) {
                          // SnackBarCustom.error("ssss");\
                          Provider.of<LoginProvider>(context, listen: false)
                              .logginApi(
                                  email: userName.text,
                                  password: password.text,
                                  context: context);
                          // Navigator.pushReplacementNamed(
                          //     context, EmployeelistingScreenView.path);
                        },
                      );
                    })
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool checkData() {
    if (userName.text != null &&
        userName.text != '' &&
        password.text != null &&
        password.text != '') {
      return true;
    }
    return false;
  }
}
