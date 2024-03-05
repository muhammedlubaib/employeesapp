// import 'package:get/get_core/src/get_main.dart';
// import 'package:get/instance_manager.dart';

// class DependencyInjection {
//   static inject() {
//     Get.lazyPut(
//       () => ApiClient(
//         Dio(BaseOptions(
//           receiveDataWhenStatusError: true,
//           connectTimeout: const Duration(seconds: 60),
//           sendTimeout: const Duration(seconds: 60),
//         )),
//         AppConfig.i,
//       ),
//     );
//     Get.lazyPut<DataRepository>(() => DataRepositoryImplementation(Get.find()));
//     Get.lazyPut<RemoteDataSource>(
//         () => RemoteDataSourceImplementation(Get.find()));
//     Get.lazyPut(() => AuthController());
//     Get.lazyPut(() => NavigationController());
//     Get.lazyPut(() => ProfileEditingController());
//     Get.lazyPut(() => RegisterController());
//     Get.lazyPut(() => DashboardController());
//     Get.lazyPut(() => VideoUploadProgressIndicator());
//   }
// }
