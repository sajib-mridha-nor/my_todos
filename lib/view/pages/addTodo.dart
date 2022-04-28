// import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:my_todos/config/config.dart';
import 'package:my_todos/services/dio_post_controller.dart';
import 'package:my_todos/view/widgets/buildTask.dart';


import '../widgets/customButton.dart';

import '../widgets/customTextfield.dart';

class AddToDo extends StatelessWidget {
  AddToDo({Key? key}) : super(key: key);
  var formKey = GlobalKey<FormState>();

  var todocntr = TextEditingController();

  var userIdcntr = TextEditingController();

  var completedcntr = TextEditingController();

  var idcntr = TextEditingController();

  //  add new todo

  @override
  Widget build(BuildContext context) {
    // var control = Get.find<DioPostController>();
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Add To New ToDo",
            style: TextStyle(
                wordSpacing: 2, letterSpacing: 5, fontStyle: FontStyle.italic),
          ),
         
          centerTitle: true,
          backgroundColor: Config().appColore,
        ),
        backgroundColor: Config().appColore,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GetBuilder<DioPostController>(
            builder: ((controller) => Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Form(
                        // key: formKey,
                        child: Column(
                      // shrinkWrap: true,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        CustomTextfield("Write your UserID... ",
                            "Enter your UserID here!", userIdcntr),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                            "Write your Id... ", "Enter your ID here!", idcntr),
                        SizedBox(
                          height: 10,
                        ),
                        CustomTextfield("Write your task... ",
                            "Enter your todo here!", todocntr),
                        const SizedBox(
                          height: 10,
                        ),
                        CustomTextfield(
                            "Write your task completed false or true... ",
                            "Enter your completed here!",
                            completedcntr)
                      ],
                    )),
                    custombutton("Add New Todo", () {
                      controller.postHttp(todocntr.text, idcntr.text,
                          userIdcntr.text, completedcntr.text);
                      todocntr.clear();
                      idcntr.clear();
                      userIdcntr.clear();
                      completedcntr.clear();

                      // controller.postHttp(todocntr.text, int.parse(idcntr.text),
                      //     int.parse(userIdcntr.text), completedcntr.text);
                    }, context),
                    Container(
                        height: h * .45,
                        child: ListView.separated(
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 3,
                                ),
                            // shrinkWrap: true,
                            // scrollDirection: Axis.horizontal,
                            itemCount: controller.postList.length,
                            itemBuilder: (context, index) => buildTask(
                                controller.postList[index]["userId"],
                                controller.postList[index]["id"],
                                controller.postList[index]["title"],
                                controller.postList[index]["completed"]))),
                  ],
                )),
          ),
        ),
      ),
    );
  }
}
