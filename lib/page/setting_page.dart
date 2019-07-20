import 'package:finchie/constant/constant.dart';
import 'package:finchie/style/styles.dart';
import 'package:finchie/util/login_util.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  _onLogout() {
    showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            content: Text('确定退出当前用户？'),
            actions: <Widget>[
              FlatButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(context).pop(LOGOUT);
                },
              ),
              FlatButton(
                child: Text('取消'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              )
            ],
          );
        }).then((msg) {
      if (msg == LOGOUT) {
        logout().then((_) {
          Navigator.of(context).pop(LOGOUT);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '设置',
          style: appbarTitleStyle,
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('退出登录'),
            onTap: _onLogout,
          )
        ],
      ),
    );
  }
}
