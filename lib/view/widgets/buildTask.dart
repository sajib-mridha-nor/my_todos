import 'package:flutter/material.dart';

Container buildTask(userId, id, title, completed) {
  Color color = Colors.indigo;
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(.5),
          spreadRadius: 3,
          blurRadius: 4,
          offset: Offset(0, 6), // changes position of shadow
        ),
      ],
      borderRadius: BorderRadius.only(
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0),
      ),
      color: color,
    ),
    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Text(
          "UserID: $userId",
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        const SizedBox(height: 5.0),
        Text(
          "ID: $id",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        Text(
          "Title : $title",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        ),
        Text(
          "Task is completed : $completed",
          style: TextStyle(fontSize: 18.0, color: Colors.white),
        )
      ],
    ),
  );
}
