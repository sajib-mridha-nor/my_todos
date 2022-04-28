import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:my_todos/services/helper/diofilterbinding.dart';
import 'package:my_todos/services/helper/diopostbinding.dart';

import 'config/config.dart';
import 'services/helper/diogetbinding.dart';
import 'view/pages/filter.dart';

import 'view/pages/welcomepage.dart';
import 'view/pages/detailspage.dart';

import 'view/pages/allTodoList.dart';
import 'view/pages/addTodo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // initialBinding: InitilizeBindig(),
      getPages: [
        GetPage(
            name: "/alltodo",
            page: () => AllTodoPage(),
            binding: DioGetbinding()),
        GetPage(
            name: "/addtodo", page: () => AddToDo(), binding: DioPostbinding()),
        GetPage(
            name: "/filter",
            page: () => FilterPage(),
            binding: DioFilterbinding()),
        GetPage(
            name: "/details",
            page: () => Detailspage(),
            binding: DioGetbinding()),
    
      ],

      debugShowCheckedModeBanner: false,
      color: Config().appColore,
      // initialBinding: Get.lazyPut(() => Controller()),
      title: Config().appName,
      home: WelcomePage(),
    );
  }
}
