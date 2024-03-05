import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:employeesapp/helper/dio_client.dart';
import 'package:employeesapp/models/contact_model.dart';
import 'package:employeesapp/models/designation_model.dart';
import 'package:employeesapp/models/employee_add_params.dart';
import 'package:employeesapp/res/pagenation_model.dart';
import 'package:employeesapp/utils/app_url.dart';
import 'package:employeesapp/utils/custom_snackbar.dart';
import 'package:employeesapp/utils/local_storage.dart/user_data.dart';
import 'package:employeesapp/view/employee_listing_screen/employee_listing_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/instance_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider extends ChangeNotifier {
  final DioClient dioClient = Get.find<DioClient>();
  bool loginloading = false;
  bool employeeViewLoading = false;
  bool employeeAddLoading = false;
  String? errorMessage;
  List<EmployeeModel> employeeModelList = [];

  // final dio = Dio();

  logginApi({String? email, String? password, BuildContext? context}) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      errorMessage = null;
      loginloading = true;
      notifyListeners();
      final response = await dioClient
          .post(Urls.loginUrl, data: {'email': email, 'password': password});

      // log(response.data['data']['access_token']);

      Navigator.pushReplacementNamed(context!, EmployeelistingScreenView.path);
      // SnackBarCustom.error('Login Successfull', context!);
      prefs.setString('access_token', response.data['data']['access_token']);

      final String? action = prefs.getString('access_token');
      log("sssss $action");

      loginloading = false;
      notifyListeners();
    } on DioException catch (e) {
      errorMessage = e.response?.data['message'];
      SnackBarCustom.error(errorMessage ?? "", context!);
      loginloading = false;
      notifyListeners();
    }
  }

  Future<PaginationModel<EmployeeModel>> employeelistviewApi(
      {BuildContext? context, int? page}) async {
    try {
      errorMessage = null;
      employeeViewLoading = true;
      notifyListeners();
      final response = await dioClient.get(
        Urls.employeesUrl,
        queryParameters: {
          'page': page,
        },
      );
      List<EmployeeModel> newItems = (response.data['data']['data'] as List)
          .map((e) => EmployeeModel.fromJson(e))
          .toList();
      return PaginationModel<EmployeeModel>.fromMap(
          response.data['data'], newItems);
    } on DioException catch (e) {
      log(e.toString());
      errorMessage = e.response?.data['message'];
      SnackBarCustom.error(errorMessage ?? "", context!);
      employeeViewLoading = false;
      notifyListeners();
      throw errorMessage.toString();
    }
  }

  //designation listing  Api

  Future<PaginationModel<DesignationModel>> designationlistApi(
      {BuildContext? context, int? page}) async {
    try {
      errorMessage = null;
      employeeViewLoading = true;
      notifyListeners();

      final response = await dioClient.get(
        Urls.designations,
        queryParameters: {
          'page': page,
        },
      );
      List<DesignationModel> newItems = (response.data['data']['data'] as List)
          .map((e) => DesignationModel.fromJson(e))
          .toList();
      return PaginationModel<DesignationModel>.fromMap(
          response.data['data'], newItems);
    } on DioException catch (e) {
      log(e.toString());
      errorMessage = e.response?.data['message'];

      SnackBarCustom.error(errorMessage ?? "", context!);
      employeeViewLoading = false;
      notifyListeners();
      throw errorMessage.toString();
    }
  }

  //employee add Api
  employyeaddapi({
    BuildContext? context,
    required EmployeeaddParams params,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final String? action = prefs.getString('access_token');
      errorMessage = null;
      employeeAddLoading = true;
      notifyListeners();
      final response = await dioClient.post(Urls.employeesUrl,
          data: await params.toFormData(),
          options: Options(headers: {'Authorization': action}));
      // log(response as String);

      // employeeModelList = (response.data['data']['data'] as List)
      //     .map((e) => EmployeeModel.fromJson(e))
      //     .toList();

      employeeAddLoading = false;
      notifyListeners();

      if (response.statusCode == 200) {
        Navigator.of(context!).pop(true);
        SnackBarCustom.success(response.data['message'] ?? "",
            context: context);
        employeelistviewApi(context: context, page: 1);
        HapticFeedback.heavyImpact();
      }
    } on DioException catch (e) {
      errorMessage = e.response?.data['message'];
      SnackBarCustom.error(errorMessage ?? "", context!);
      employeeAddLoading = false;
      notifyListeners();
    }
    employeeAddLoading = false;
    notifyListeners();
  }

  //logginApi({String? email, String? password, BuildContext? context}) async {}
}
