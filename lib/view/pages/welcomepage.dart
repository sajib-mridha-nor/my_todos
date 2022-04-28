import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../widgets/customButton.dart';
import '../widgets/waveClipper.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              ClipPath(
                clipper: WaveClipper2(),
                child: Container(
                  child: Column(),
                  width: double.infinity,
                  height: h * .365,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(45, 225, 81, 105),
                    Color.fromARGB(88, 254, 73, 76)
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper3(),
                child: Container(
                  width: double.infinity,
                  height: h * .372,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(52, 202, 58, 255),
                    Color.fromARGB(78, 254, 73, 106)
                  ])),
                ),
              ),
              ClipPath(
                clipper: WaveClipper1(),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: h * .05,
                      ),
                      Icon(
                        FontAwesomeIcons.tasks,
                        color: Colors.white,
                        size: 60,
                      ),
                      SizedBox(
                        height: h * .02,
                      ),
                      Text(
                        "Welcome To TODO",
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 30),
                      ),
                    ],
                  ),
                  width: double.infinity,
                  height: h * .37,
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(colors: [
                    Color.fromARGB(194, 248, 60, 91),
                    Color.fromRGBO(114, 65, 227, 0.943)
                  ])),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          custombutton("See All Todos", () {
            Get.toNamed("alltodo");
            print("object");
          }, context),
          const SizedBox(
            height: 20,
          ),
          custombutton("Go To Add ToDo", () {
            Get.toNamed("addtodo");
          }, context),
          const SizedBox(
            height: 20,
          ),
          custombutton("See Users", () {
            Get.toNamed(
              "filter",
            );
          }, context),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
