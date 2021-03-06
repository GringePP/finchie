import 'package:finchie/constant/constant.dart';
import 'package:flutter/material.dart';
import 'package:finchie/widget/dialog_widgets.dart';
import 'package:finchie/network/yuque_api.dart';

class TokenVerifyDialog extends StatefulWidget {
  TokenVerifyDialog({@required this.token});

  final token;

  @override
  State<StatefulWidget> createState() => _TokenVerifyDialogState();
}

class _TokenVerifyDialogState extends State<TokenVerifyDialog> {
  bool loading = true;
  bool isTokenValid = false;
  Map<String, dynamic> info;

  @override
  void initState() {
    super.initState();
    //verify token by sending request
    verifyToken(widget.token, onSuccess: (_info) {
      setState(() {
        loading = false;
        isTokenValid = true;
        info = _info;
      });
    }, onError: (_) {
      setState(() {
        loading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CommonDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(right: 10),
                child: Text(loading ? '正在校验Token有效性' : 'Token有效性：'),
              ),
              Container(
                width: 20,
                height: 20,
                child: loading
                    ? CircularProgressIndicator()
                    : Icon(
                        isTokenValid ? Icons.done : Icons.clear,
                        color: Theme.of(context).primaryColor,
                      ),
              )
            ],
          ),
          isTokenValid
              ? Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Row(
                    children: <Widget>[
                      Container(
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.only(right: 10),
                        child: CircleAvatar(
                          backgroundImage:
                              NetworkImage(info['small_avatar_url']),
                        ),
                      ),
                      Text(info['name'])
                    ],
                  ),
                )
              : Container(),
          isTokenValid
              ? Container(
                  alignment: Alignment.bottomRight,
                  child: FlatButton(
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    onPressed: () => Navigator.of(context).pop(info),
                    child: Text('登录'),
                  ),
                )
              : Container()
        ],
      ),
    );
  }
}
