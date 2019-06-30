import 'package:flutter/material.dart';
import 'package:finchie/style/styles.dart';

Container buildCardContainer(Widget widget,
    {color = Colors.white,
    padding = const EdgeInsets.all(20),
    margin = const EdgeInsets.all(10)}) {
  return Container(
    padding: padding,
    margin: margin,
    decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: boxShadow),
    child: widget,
  );
}
