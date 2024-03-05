// // import 'package:brokees/env/production_env.dart';
// // import 'package:brokees/src/utilities/app_constants.dart';
// // import 'package:dio/dio.dart';
// // import 'package:flutter/material.dart';

// // import '../../../env/env.dart';
// // import '../utilities/snackbar.dart';

// import 'package:dio/dio.dart';
// import 'package:employeesapp/res/constants/app_constants.dart';
// import 'package:flutter/material.dart';

// class ApiException implements Exception {
//   final dynamic error;

//   ApiException([this.error]);

//   String toString() {
//     if (error == null) return "Something went wrong";
//     if (error is Exception) {
//       try {
//         // ignore: deprecated_member_use
//         if (error is DioError) {
//           switch (error.type) {
//             case DioErrorType.cancel:
//               return "Request to server was cancelled";

//             case DioErrorType.connectTimeout:
//               return "Connection timeout! check internet connection";

//             case DioErrorType.other:
//                 // AppConstants.navigatorKey.currentContext!.fluidSnackBar("hello");
//                 Future.delayed(const Duration(milliseconds: 300),(){
//                    ScaffoldMessenger.of(AppConstants.navigatorKey.currentContext!).removeCurrentSnackBar(
//                     reason: SnackBarClosedReason.remove);
//                 ScaffoldMessenger.of(
//                   AppConstants.navigatorKey.currentContext!).showSnackBar(snackBarBlack("No Internet Connection"));
                 
//                 }); 
                  
                
// //ScaffoldMessenger.of(AppConstants.navigatorKey.currentContext!).showSnackBar(snackBarBlack("No Internet Connection"));

//               return "Connection to server failed due to internet connection";

//             case DioErrorType.receiveTimeout:
//               return "Receive timeout in connection with server";

//             case DioErrorType.response:
//               switch (error.response.statusCode) {
//                 case 404:
//                 case 500:
//                 case 503:
//                   return Env.instance.type == EnvironmentType.production
//                       ? 'Something went wrong!'
//                       : error.response.statusMessage;

//                 default:
//                   if (error?.response?.data['message'] != null) {
//                     return error.response.data['message'].toString();
//                   } else {
//                     return "Failed to load data - status code: ${error.response.statusCode}";
//                   }
//               }

//             case DioErrorType.sendTimeout:
//               return "Send timeout with server";
//           }
//         } else {
//           return "Unexpected error occurred";
//         }
//       } on FormatException catch (e) {
//         return e.toString();
//       }
//     } else {
//       return Env.instance.type == EnvironmentType.production
//           ? "Something went wrong!"
//           : "${error.toString()} is not a subtype of exception";
//     }
//     return Env.instance.type == EnvironmentType.production
//         ? "Something went wrong!"
//         : error.toString();
//   }
// }
