import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_todos/config/config.dart';
import 'package:my_todos/services/dio_get_controller.dart';
import 'package:my_todos/view/widgets/loading0verlay.dart';

class Detailspage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black),
          title: Text(
            'Todo Details Page',
            style: TextStyle(
                color: Colors.black,
                wordSpacing: 2,
                letterSpacing: 5,
                fontStyle: FontStyle.italic),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: GetBuilder<DioGetController>(
          builder: (controller) => LoadingOverlay(
            isLoading: controller.isload2,
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Expanded(
                    child: Material(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0))),
                      elevation: 0,
                      color: Config().appColore,
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(32.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              "UserID: ${controller.singledata["userId"]}",
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                            const SizedBox(height: 5.0),
                            Text(
                              "Id :  ${controller.singledata["id"]}",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            Text(
                              "Title : ${controller.singledata["title"]}",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            ),
                            Text(
                              "Task is completed : ${controller.singledata["completed"]}",
                              style: TextStyle(
                                  fontSize: 20.0, color: Colors.white),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ]),
          ),
        ));
  }
}
