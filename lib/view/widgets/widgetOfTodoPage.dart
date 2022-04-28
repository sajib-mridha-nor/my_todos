import 'package:flutter/material.dart';

Widget buildDateHeader(title) {
  const TextStyle boldStyle = const TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 24,
      letterSpacing: 2.0);
  // return Text("data");
  return Row(
    children: <Widget>[
      const SizedBox(width: 20.0),
      Text(
        title.toUpperCase(),
        style: boldStyle,
      )
    ],
  );
}

class HeaderFooterwidget extends StatelessWidget {
  final Widget header;

  final Widget body;
  // final Color headerColor;

  const HeaderFooterwidget({
    Key? key,
    required this.header,
    required this.body,
    // this.headerColor = Color.fromARGB(255, 81, 35, 121),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return buildBody();
  }

  Stack buildBody() {
    return Stack(
      children: <Widget>[
        const Positioned(
          top: 50,
          bottom: 0,
          right: 0,
          width: 40,
          child: DecoratedBox(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(begin: Alignment.bottomCenter, colors: [
                  Colors.indigo,
                  Color.fromARGB(212, 167, 58, 175),
                ]),
                color: Color.fromARGB(210, 211, 53, 61),
                borderRadius: BorderRadius.only(topLeft: Radius.circular(90))),
          ),
        ),
        Column(
          children: [
            buildHeader(),
            Expanded(
              child: Container(
                // margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  // color: Color.fromARGB(255, 253, 73, 73),
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: body,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildHeader() {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(40.0),
            bottomRight: Radius.circular(-30.0)),
        color: Color.fromARGB(212, 167, 58, 175),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      child: header,
    );
  }
}
