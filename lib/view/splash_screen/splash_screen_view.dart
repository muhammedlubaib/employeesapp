import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  static const String path = "splashScreen";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("SplashScreen"),
      ),
    );
  }
}
