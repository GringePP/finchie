import 'package:flutter/material.dart';

startPage(context, Widget w) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => w));
}

closePage(context) {
  if (Navigator.canPop(context)) Navigator.pop(context);
}


splitTime(time) {
  return time.split('T')[0];
}