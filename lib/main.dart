import 'package:finchie/constant/constant.dart';
import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/page/home_page.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/util/login_util.dart' as loginUtil;
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
    // setState(() {
    //   isLogin = false;
    // });
    loginUtil.checkLogin().then((loginInfo) {
      if (loginInfo != null) {
        updateToken(loginInfo["token"]);
        updateUserId(loginInfo["user_id"]);
        setState(() {
          isLogin = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: isLogin
          ? HomePage()
          : NoLoginWidget(
              onLogin: (res) {
                if (res == LOGIN) {
                  setState(() {
                    isLogin = true;
                  });
                }
              },
            ),
    );
  }
}

class NoLoginWidget extends StatelessWidget {
  NoLoginWidget({this.onLogin});

  final onLogin;

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
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Text(
                  '还没有登录，请输入Token登录',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              RaisedButton(
                onPressed: () => startPage(context, LoginPage()).then((res) {
                      onLogin(res);
                    }),
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
