import 'package:employeesapp/helper/dio_client.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/instance_manager.dart';


class DI {
  static inject() {
    // Get.lazyPut(() => NavigationController());
    // Get.lazyPut(() => PostAddController());
    Get.lazyPut(() => DioClient());
    // Get.lazyPut(() => AuthController());
    // Get.lazyPut(() => PostController());
    // Get.lazyPut(() => NotificationController());
    // Get.lazyPut(() => FollowerRequestFollowingController());
  }
}
