
import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class InfoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InfoPageState();
  }
}

class _InfoPageState extends State<InfoPage> {
  final String title = 'Info Page';

  Map<String, dynamic> info = {
    "name": "",
    "small_avatar_url": "",
    "created_at": "",
    "avatar_url": ""
  };

  @override
  void initState() {
    super.initState();
    fetch(USER_INFO_URL,
        onSuccess: (res) => this.setState(() {
              info = res['data'];
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[UserInfoWidget(info)],
        ),
      ),
    );
  }
}
