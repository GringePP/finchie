import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const textTitle =
    TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

const appbarTitleStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w600);

const boxShadow = <BoxShadow>[
  BoxShadow(
    color: Color(0x22000000),
    offset: Offset(2, 3),
    blurRadius: 5.0,
  )
];

const docTitle = TextStyle(
    color: Color(0xFF333333), fontWeight: FontWeight.w700, fontSize: 25);

const docBody = TextStyle(
    color: Color(0xFF333333), fontWeight: FontWeight.w300, fontSize: 16);

randomColor() {
  final total = Colors.primaries.length;
  final randomIdx = Random().nextInt(total);
  return Colors.primaries[randomIdx][500];
}
