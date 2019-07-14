import 'package:finchie/constant/constant.dart';
import 'package:finchie/style/styles.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/util/login_util.dart';
import 'package:finchie/widget/token_verify_dialog.dart';
import 'package:flutter/material.dart';
import 'package:finchie/page/token_instruct_page.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:finchie/network/yuque_api.dart';

class LoginPage extends StatelessWidget {
  _onSubmit(context, token) {
    if (token == null || token == '') {
      Fluttertoast.showToast(msg: 'Token不能为空', toastLength: Toast.LENGTH_SHORT);
      return;
    }
    showDialog(
      context: context,
      builder: (_) => TokenVerifyDialog(token: token),
    ).then((res) {
      if (res != null) {
        // if login succeeds, update token and userid, meanwhile inform the home page.
        updateToken(token);
        updateUserId(res['id']);
        saveLoginInfo(token, res['id']).then((_) {
          Navigator.of(context).pop(LOGIN);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController.fromValue(TextEditingValue());
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "登录",
            style: appbarTitleStyle,
          ),
        ),
        body: Container(
          child: Center(
            child: ListView(
              padding: EdgeInsets.all(20),
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(bottom: 20),
                  child: TextField(
                      controller: textController,
                      decoration: InputDecoration(labelText: '请输入Token')),
                ),
                RaisedButton(
                    onPressed: () => _onSubmit(context, textController.text),
                    color: Colors.blue,
                    padding: EdgeInsets.all(12),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(40))),
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        '登录',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    )),
                GestureDetector(
                  onTap: () => startPage(context, TokenInstructPage()),
                  child: Container(
                    padding: EdgeInsets.only(top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "如何获得Token？",
                      style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(50),
                  child: Text('Logo here'),
                )
              ],
            ),
          ),
        ));
  }
}
