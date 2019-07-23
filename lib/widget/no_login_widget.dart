import 'package:flutter/material.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/page/login_page.dart';

class NoLoginWidget extends StatelessWidget {
  NoLoginWidget({this.callback});

  final callback;

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
                  callback(res);
                }),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(40))),
                child: Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Icon(
                          Icons.done,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        '确定',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
