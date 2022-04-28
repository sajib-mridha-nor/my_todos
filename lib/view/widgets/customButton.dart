import 'package:flutter/material.dart';

import 'package:my_todos/config/config.dart';

Widget custombutton(text, var onpress, context) {
  double h = MediaQuery.of(context).size.height;
  double w = MediaQuery.of(context).size.height;
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      width: w / 4,
      height: h * .068,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Color.fromARGB(137, 232, 37, 115), Colors.indigo]),
          // color: Color.fromARGB(255, 63, 181, 150),
          borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          ),
          boxShadow: [
            BoxShadow(
                color: Colors.grey,
                offset: Offset(1.0, 2.0),
                blurRadius: 8.0,
                spreadRadius: 2.0)
          ]),
      child: TextButton(
        onPressed: onpress,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
          child: Text(
            text,
            style: TextStyle(fontSize: h * .030, color: Colors.white),
          ),
        ),
      ),
    ),
  );
}
