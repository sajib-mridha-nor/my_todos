import 'package:get/get.dart';
import 'package:my_todos/services/dio_filter_controller.dart';
import 'package:my_todos/services/dio_get_controller.dart';

class DioFilterbinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioFilterController());
  }
}
