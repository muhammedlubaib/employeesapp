import 'package:employeesapp/res/style/color.dart';
import 'package:employeesapp/res/style/dimensions.dart';
import 'package:employeesapp/res/style/text_styles.dart';
import 'package:employeesapp/utils/custom_snackbar.dart';
import 'package:employeesapp/utils/general_utilis.dart';
import 'package:employeesapp/view/employee_listing_screen/employee_listing_screen_view.dart';
import 'package:employeesapp/view_model/auth_view_model/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  @override
  void initState() {
    userName.text = "nidhinnp@gmail.com";
    password.text = "12345678Np";
    super.initState();
  }

//  bool formvalidation =
//   bool validateForm() {
//     Future.delayed(Duration(milliseconds: 100), () {
//       if (loginFormkey.currentState!.validate()) {
//         return true;
//       } else {
//         return false;
//       }
//     });
//   }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
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
          Expanded(
            child: Container(
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
                      },
                    ),
                    gap21,
                    TextFieldCustom(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      // keyboardType: TextInputType.name,
                      controller: password,
                      //  obscure: true,
                      prefixWidget: const Icon(
                        Icons.key,
                        color: ColorResources.textColor,
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter password";
                        }
                        if (value!.length < 4) {
                          return "Please enter atleast 5 Character";
                        }
                      },
                      hintText: "Password",
                    ),
                    gapXL,
                    Consumer<LoginProvider>(builder: (context, controller, _) {
                      return SubmitButton(
                        showLoader: controller.loginloading,
                        isEnabled: loginFormkey.currentState!.validate(),
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
          ),
        ],
      ),
    );
  }
}
