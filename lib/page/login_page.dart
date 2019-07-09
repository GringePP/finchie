import 'package:finchie/style/styles.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/widget/dialog_widgets.dart';
import 'package:flutter/material.dart';
import 'package:finchie/page/token_instruct_page.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginPage extends StatelessWidget {
  _onSubmit(context, token) {
    if (token == null || token == '') {
      Fluttertoast.showToast(msg: 'Token不能为空', toastLength: Toast.LENGTH_SHORT);
      return;
    }
    showDialog(
        context: context,
        builder: _dynamicDialogBuilder,);
  }

  Widget _dynamicDialogBuilder(BuildContext context) {
    bool loading = true;
    bool isTokenValid = false;
    return StatefulBuilder(
      builder: (ctx, StateSetter setState) {
        return CommonDialog(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 10),
                    child: Text('正在校验Token有效性'),
                  ),
                  Container(
                    width: 20,
                    height: 20,
                    child: loading
                        ? CircularProgressIndicator()
                        : Icon(isTokenValid ? Icons.done : Icons.clear),
                  )
                ],
              )
            ],
          ),
        );
      },
    );
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
