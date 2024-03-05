import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:employeesapp/res/constants/app_constants.dart';
import 'package:employeesapp/utils/app_url.dart';
import 'package:employeesapp/utils/local_storage.dart/user_data.dart';
import 'package:employeesapp/view/login/login_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DioClient {
  // static DioClient get i => getPackage.Get.find();
  Dio dio = Dio();
  String? token;
  late String fcmToken;

  DioClient() {
    dio
      ..options.baseUrl = Urls.baseURL
      ..options.connectTimeout = const Duration(milliseconds: 30000)
      ..options.receiveTimeout = const Duration(milliseconds: 30000);
    dio.interceptors.add(PrettyDioLogger(
      requestBody: true,
    ));
    dio.interceptors.add(LoggingInterceptor());
    dio.interceptors.add(
      QueuedInterceptorsWrapper(
        onError: (DioException error, ErrorInterceptorHandler handler) async {
          if (error.response?.statusCode == 401) {
            LocalStorage().removeLoginData();
            // AppRoute.routerConfig.pushReplacementNamed(AppRoute.loginScreen);
            Navigator.pushNamedAndRemoveUntil(
                AppConstants.navigatorKey.currentContext!,
                LoginScreen.path,
                (route) => false);
          } else {
            return handler.next(error);
          }
        },
      ),
    );
  }

  Future<Response> get(
    String uri, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      // print("no network");
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      // log("123Get $e");
      rethrow;
    }
  }

  Future<Response> post(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      // print("no network - 1");
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      // print("no network - 2 ");
      rethrow;
    }
  }

  Future<Response> put(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
    String uri, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    try {
      var response = await dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }
}

class LoggingInterceptor extends InterceptorsWrapper {
  @override
  Future onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    DateTime now = DateTime.now().toUtc();
    // String? token = await LocalStorage().readlocalStorage();
    final prefs = await SharedPreferences.getInstance();
    final String? accesstoken = prefs.getString(AppConstants.userKey);
    // String accesstoken  = prefs.getString('access_token');
    //.getString('action');
    options.headers.addAll({
      'Timestamp': now.millisecondsSinceEpoch,
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $accesstoken',
      'Access-Control-Allow-Origin': '*',
      'Accept': 'application/json',
      'Device-Type': Platform.isAndroid
          ? 1
          : Platform.isIOS
              ? 2
              : 0,
      // 'Device-Token': AppConstants.fcmToken ?? "",
      // 'Language': di.sl<LanguageBloc>().locale.languageCode,
      // 'User-Agent': AppConstants.userAgent ?? {}
    });

    log("Headers: ${options.headers.toString()}");
    log("Parms: ${options.data.toString()}");
    return super.onRequest(options, handler);
  }

  @override
  Future onResponse(
      Response response, ResponseInterceptorHandler handler) async {
    try {
      log(jsonEncode(response.data).toString());
      if (response.statusCode == 200) {
        return super.onResponse(response, handler);
      } else if (response.data['status'] == true) {
        return response.data['status'] == true
         
            ? super.onResponse(response, handler)
            : handler.reject(DioException(
                requestOptions: response.requestOptions,
                error: response.data,
                response: response,
                type: DioExceptionType.unknown));
        //newly added else
      } else {
        return response.data['status'] == true
     
            ? super.onResponse(response, handler)
            : handler.reject(DioException(
                requestOptions: response.requestOptions,
                error: response.data,
                response: response,
                type: DioExceptionType.unknown));
      }
    } catch (e) {
      handler.reject(DioException(
        requestOptions: response.requestOptions,
        error: "Something went wrong",
        response: response,
        type: DioExceptionType.unknown,
      ));
    }
  }

  @override
  Future onError(DioException err, ErrorInterceptorHandler handler) async {
    return super.onError(err, handler);
  }
}
