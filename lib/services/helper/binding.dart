import 'package:get/get.dart';

import '../dio_filter_controller.dart';
import '../dio_get_controller.dart';
import '../dio_post_controller.dart';

class InitilizeBindig implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DioFilterController());
     Get.lazyPut(() => DioGetController());
      Get.lazyPut(() => DioPostController());
      
  }
}
