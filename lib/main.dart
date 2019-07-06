import 'package:finchie/page/home_page.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/util/login_util.dart' as loginUtil;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:finchie/page/login_page.dart';

void main() {
  // debugPaintSizeEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      isLogin = loginUtil.isLogin();
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget homePage;
    if (!isLogin) {
      homePage = NoLoginWidget();
    } else {
      homePage = HomePage();
    }
    return MaterialApp(
      home: homePage,
    );
  }
}

class NoLoginWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Finchie'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('还没有登录，请输入Token登录'),
              RaisedButton(
                onPressed: () => startPage(context, LoginPage()),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Text(
                    '确定',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
