// import 'package:employeesapp/res/di.dart';
// import 'package:flutter/material.dart';
// import 'package:gsl_student_app/core/di.dart';

// import '../main.dart';
// import '../modules/general/bloc/core_bloc.dart';
// import 'package:get_it/get_it.dart';

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
