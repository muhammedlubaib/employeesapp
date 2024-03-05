import 'package:dio/dio.dart';
import 'package:employeesapp/utils/app_url.dart';

import '../helper/interceptors.dart';

class DataRepository {
  final Dio _client =
      Dio(BaseOptions(baseUrl: Urls.baseURL, contentType: "application/json"));

  static DataRepository get i => _instance;
  static final DataRepository _instance = DataRepository._private();

  DataRepository._private() {
    _client.interceptors.add(LoggingInterceptor());
  }
}
