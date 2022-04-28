import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_todos/config/config.dart';
import 'package:my_todos/services/dio_filter_controller.dart';
import 'package:my_todos/services/dio_get_controller.dart';
import 'package:my_todos/view/widgets/loading0verlay.dart';

class FilterPage extends StatelessWidget {
  FilterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DioGetController());

    return Scaffold(
      backgroundColor: Config().appColore,
      appBar: AppBar(
        title: const Text(
          "Filter Todo",
          style: TextStyle(
              wordSpacing: 2, letterSpacing: 5, fontStyle: FontStyle.italic),
        ),
        backgroundColor: Config().appColore,
      ),
      body: GetBuilder<DioFilterController>(
        builder: (controller) => LoadingOverlay(
          isLoading: controller.isloading,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text("Select a user to see user todo",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2.0)),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButton(
                  elevation: 10,
                  iconEnabledColor: Color.fromRGBO(47, 106, 200, 1),
                  value: controller.selectedValue,
                  iconSize: 40,
                  items: List.generate(
                    controller.userList.length,
                    // controller.l.length,
                    (index) => DropdownMenuItem(
                        onTap: (() {
                          controller.selectedvalue(
                              controller.userList[index]["name"]);
                          print(controller.filterTodolist[index]["title"]);
                          controller.getTodoId(index);

                          // for dropdown value
                          // controller.todoselectedvale(
                          //     controller.filterTodolist[index]["title"]);
                        }),
                        child: Text(controller.userList[index]["name"],
                            style: TextStyle(fontStyle: FontStyle.italic
                                // color: Colors.white,

                                )),
                        value: controller.userList[index]["name"]),
                  ),
                  onChanged: (t) {},
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Text("This user all todo list here",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          letterSpacing: 2.0)),
                ),

                // Dropdown section
                //
                //
                //
                //......

                // controller.isloading2 == true
                //     ? GetBuilder<DioFilterController>(
                //         builder: (controller) => Container(
                //           width: 450,
                //           child: Padding(
                //             padding: const EdgeInsets.all(4.0),
                //             child: DropdownButton(
                //               elevation: 10,
                //               style: TextStyle(fontStyle: FontStyle.italic),
                //               icon: Icon(Icons.arrow_downward_sharp),
                //               hint: Text("This user all todo list here!"),
                //               autofocus: true,
                //               menuMaxHeight: 550,
                //               alignment: Alignment.center,
                //               borderRadius: BorderRadius.all(Radius.circular(20)),
                //               isExpanded: true,
                //               itemHeight: 130,
                //               dropdownColor: Color.fromARGB(255, 226, 237, 206),
                //               value: controller.todoselected,
                //               items: List.generate(
                //                   controller.filterTodolist.length,
                //                   // controller.l.length,
                //                   (index) => DropdownMenuItem(
                //                         alignment: Alignment.center,
                //                         child: Padding(
                //                           padding: const EdgeInsets.all(5.0),
                //                           child: Card(
                //                             color: Colors.white,
                //                             child: Padding(
                //                               padding: const EdgeInsets.all(4.0),
                //                               child: Column(
                //                                 crossAxisAlignment:
                //                                     CrossAxisAlignment.stretch,
                //                                 mainAxisSize: MainAxisSize.max,
                //                                 children: [
                //                                   Text(
                //                                     "ID : " +
                //                                         controller
                //                                             .filterTodolist[index]
                //                                                 ["id"]
                //                                             .toString(),
                //                                     overflow: TextOverflow.fade,
                //                                     maxLines: 2,
                //                                   ),
                //                                   SizedBox(
                //                                     height: 2,
                //                                   ),
                //                                   Text("UserId : " +
                //                                       controller
                //                                           .filterTodolist[index]
                //                                               ["userId"]
                //                                           .toString()),
                //                                   Text(
                //                                     "title : " +
                //                                         controller.filterTodolist[
                //                                             index]["title"],
                //                                     overflow: TextOverflow.fade,
                //                                     maxLines: 2,
                //                                   ),
                //                                   SizedBox(
                //                                     height: 2,
                //                                   ),
                //                                   Text("Is it Complete : " +
                //                                       controller
                //                                           .filterTodolist[index]
                //                                               ["completed"]
                //                                           .toString())
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                //                         ),
                //                         value: controller.filterTodolist[1]
                //                             ["title"],
                //                       )),
                //               onChanged: (t) {
                //

                //                 // print(t);
                //               },
                //             ),
                //           ),
                //         ),
                //       )
                //     : Container(
                //         child: Text("No data"),
                //       ),
                controller.isloading2 == true
                    ? Container(
                        height: MediaQuery.of(context).size.height * 0.7,
                        child: SingleChildScrollView(
                          child: Column(
                              children: List.generate(
                            controller.filterTodolist.length,
                            (index) => Card(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Text(
                                      "ID : " +
                                          controller.filterTodolist[index]["id"]
                                              .toString(),
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text("UserId : " +
                                        controller.filterTodolist[index]
                                                ["userId"]
                                            .toString()),
                                    Text(
                                      "title : " +
                                          controller.filterTodolist[index]
                                              ["title"],
                                      overflow: TextOverflow.fade,
                                      maxLines: 2,
                                    ),
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text("Is it Complete : " +
                                        controller.filterTodolist[index]
                                                ["completed"]
                                            .toString())
                                  ],
                                ),
                              ),
                            ),
                          )),
                        ),
                      )
                    : Container(
                        child: Text("No data"),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
