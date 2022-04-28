import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:my_todos/config/config.dart';
import 'package:my_todos/constants/constants.dart';
import 'package:my_todos/services/dio_get_controller.dart';
import 'package:my_todos/view/widgets/loading0verlay.dart';

import '../widgets/buildTask.dart';
import '../widgets/widgetOfTodoPage.dart';

class AllTodoPage extends StatelessWidget {
  AllTodoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var control = Get.find<DioGetController>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color.fromARGB(212, 167, 58, 175),
      ),
      body: HeaderFooterwidget(
        // headerColor: Config().appColore,
        header: buildDateHeader("All Todo"),
        body: GetBuilder<DioGetController>(
            builder: (controller) => LoadingOverlay(
                  isLoading: controller.isload,
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        height: h * .8,
                        width: w * .5,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.separated(
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                    height: 3,
                                  ),
                              shrinkWrap: true,
                              // scrollDirection: Axis.horizontal,
                              itemCount: controller.alltodolist.length,
                              itemBuilder: (context, index) => InkWell(
                                    onTap: (() {
                                      ;

                                      controller.getsingleHttp(controller.alltodolist[index]["id"]);
                                      Get.toNamed('details');
                                      print('$todobaseUrl/$index');
                                    }),
                                    child: buildTask(
                                        controller.alltodolist[index]["userId"],
                                        controller.alltodolist[index]["id"],
                                        controller.alltodolist[index]["title"],
                                        controller.alltodolist[index]
                                            ["completed"]),
                                  )),
                        ),
                      ),
                    ],
                  ),
                )),
      ),
    );
  }
}
