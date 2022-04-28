import 'package:get/get.dart';
import 'package:my_todos/services/dio_get_controller.dart';

class DioGetbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioGetController());
  }
}
