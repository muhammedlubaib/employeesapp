// import 'package:employeesapp/helper/di.dart';
// import 'package:employeesapp/helper/env/core_bloc.dart';
// import 'package:employeesapp/main.dart';
// import 'package:flutter/material.dart';

// abstract class Env {
//   final String domainUrl;
//   static late Env instance;

//   Env({
//     required this.domainUrl,
//   }) {
//     boot();
//   }
//   void boot() async {
//     instance = this;
//     WidgetsFlutterBinding.ensureInitialized();
//     await DI.inject();
//     await CoreBloc().initSharedData();

//     runApp(MyApp(
//       env: this,
//     ));
//   }
// }

// enum EnvironmentType { development, staging, production }
