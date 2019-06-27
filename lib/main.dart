import 'package:finchie/page/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main(){
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(
        title: 'Finchie App',
      ),
    );
  }
}
