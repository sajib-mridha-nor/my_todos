import 'package:get/get.dart' hide Response;
import 'package:my_todos/services/interceptor.dart';
import 'package:dio/dio.dart';

import '../constants/constants.dart';
import '../models/singletodo.dart';
import '../models/usermodel.dart';

class DioFilterController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit

    getTodoId(1);
    super.onInit();
    getUser(userbaseUrl);

    update();

    isloading = true;
  }

  selectedvalue(name) async {
    selectedValue = await name;
    update();
  }

  todoselectedvale(name) async {
    todoselected = await name;
    update();
  }

  String selectedValue = "Leanne Graham";
  String todoselected = "delectus aut autem";
  List postList = [];

  final Dio _dio = Dio();
  bool isloading = true;
  bool isloading2 = true;

  List userList = <UserModel>[];
  List filterTodolist = <Singletodo>[];

  getTodoId(index) async {
    Response response;

    try {
      response =
          await _dio.get(todobaseUrl, queryParameters: {'userId': index});

      print("this id coming");
      if (response.statusCode == 200) {
        filterTodolist = response.data;
        filterTodolist
            .map(
              (e) => Singletodo.fromJson(e),
            )
            .toList()
            .obs;
        isloading = false;
        update();
        print("this id coming2");

        print(filterTodolist);
      } else {
        print("Data is not found");
        isloading = true;
        update();
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    InitializeInterceptors();

    return response;
  }

  getUser(url) async {
    Response response;
    try {
      response = await _dio.get(url);

      print("this $response");
      if (response.statusCode == 200) {
        userList = response.data;
        userList
            .map(
              (e) => UserModel.fromJson(e),
            )
            .toList()
            .obs;
        isloading = false;
        update();

        print(userList);
      } else {
        print("fail to load");

        isloading = true;
      }
    } on DioError catch (e) {
      print(e.message);
      throw Exception(e.message);
    }
    InitializeInterceptors();
    return response;
  }
}
