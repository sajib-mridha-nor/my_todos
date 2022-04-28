import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:my_todos/constants/constants.dart';
import 'package:my_todos/models/singletodo.dart';
import 'package:dio/src/response.dart';
import 'package:flutter/material.dart';
import 'package:my_todos/models/usermodel.dart';
import 'package:my_todos/services/interceptor.dart';

class DioGetController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getTodoHttp(1, 10);
  }

  bool isload = true;
  bool isload2 = true;

  late Response response;
  List alltodolist = <Singletodo>[].obs;
  List filterTodolist = <Singletodo>[].obs;
  Map singledata = {}.obs();

  Dio _dio = Dio();
  getTodoHttp(start, limit) async {
    try {
      response = await _dio.get(todobaseUrl,
          queryParameters: {'_start': start, '_limit': limit});

      if (response.statusCode == 200) {
        alltodolist = response.data;
        alltodolist
            .map(
              (e) => Singletodo.fromJson(e),
            )
            .toList()
            .obs;
        isload = false;
        update();
      }
    } catch (e) {
      isload = true;
      print(e);
      print("Data is not found");
    }
    InitializeInterceptors();
    return response;
  }


  getsingleHttp(endpoint) async {
    String fullUrl = '$todobaseUrl/$endpoint';
    
    try {
    
      response = await _dio.get(fullUrl);

      print("this $response");
      if (response.statusCode == 200) {
        singledata = response.data;
        print('this after $singledata');
        isload2 = false;

       
        update();
      }
    } catch (e) {
      isload2 = true;
      print(e);
    }
    InitializeInterceptors();
    return response;
  }
}
