import 'package:get/get.dart' hide Response;
import 'package:my_todos/services/interceptor.dart';
import 'package:dio/dio.dart';

import '../constants/constants.dart';

class DioPostController extends GetxController {
  List postList = [];

  final Dio _dio = Dio();

  postHttp(String? title, id, userId, completed) async {
    Response _response;

    try {
      _response = await _dio.post(todobaseUrl, data: <String, dynamic>{
        "title": title,
        "id": id,
        "userId": userId,
        "completed": completed
      });
      print(_response.statusCode);
      print(_response);

      if (_response.statusCode == 201) {
        print("Successfully created");
        Get.snackbar("status code 201", "you are succesfully add new todo",
            snackPosition: SnackPosition.BOTTOM);

        var _data = _response.data;
        print(_data);
        postList.add(_data);
        print(postList);
        update();

        return postList;
      } else {
        print("fail to create");
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    InitializeInterceptors();

    return _response;
  }
}
