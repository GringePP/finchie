import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

const textTitle =
    TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold);

const boxShadow = <BoxShadow>[
  BoxShadow(
    color: Color(0x22000000),
    offset: Offset(2, 5),
    blurRadius: 10.0,
  )
];

randomColor() {
  final total = Colors.primaries.length;
  final randomIdx = Random().nextInt(total);
  return Colors.primaries[randomIdx];
}
