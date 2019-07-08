import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

startPage(context, Widget w) {
  Navigator.push(context, MaterialPageRoute(builder: (ctx) => w));
}

closePage(context) {
  if (Navigator.canPop(context)) Navigator.pop(context);
}

splitTime(time) {
  return time.split('T')[0];
}

saveString(String key, String value) async {
  final sp = await SharedPreferences.getInstance();
  await sp.setString(key, value);
}
