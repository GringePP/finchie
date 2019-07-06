import 'package:finchie/page/home_page.dart';
import 'package:finchie/util/login_util.dart' as loginUtil;
import 'package:finchie/widget/loading_dialog.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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
      homePage = HomePage(title: '我的知识库');
    }
    return MaterialApp(
      home: homePage,
    );
  }
}

class NoLoginWidget extends StatelessWidget {
  _onPress(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: true,
        builder: (ctx) {
          return LoadingDialog();
        });
    Future.delayed(Duration(milliseconds: 2000), () {
      Navigator.of(context, rootNavigator: false).pop();
    });
  }

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
                onPressed: () => _onPress(context),
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
