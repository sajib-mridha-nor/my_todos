import 'package:get/get.dart';
import 'package:my_todos/services/dio_get_controller.dart';

import '../dio_post_controller.dart';

class DioPostbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioPostController());
  }
}
