import 'package:flutter/material.dart';

Container buildCardContainer(Widget w, {double height = 100}) {
  return Container(
    padding: EdgeInsets.all(20),
    margin: EdgeInsets.all(10),
    height: height,
    decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Color(0x22000000),
            offset: Offset(2, 5),
            blurRadius: 10.0,
          ),
        ]),
    child: w,
  );
}
