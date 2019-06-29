import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/page/introduce_page.dart';
import 'package:finchie/widget/card_generator.dart';
import 'package:finchie/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:finchie/page/info_page.dart';

import 'package:finchie/util/common_util.dart';

class HomePage extends Scaffold {
  HomePage({this.title});

  final String title;

  @override
  ScaffoldState createState() {
    return _HomePageState(title: this.title);
  }
}

class _HomePageState extends ScaffoldState {
  _HomePageState({this.title});

  final String title;
  Map<String, dynamic> userInfo = {
    "name": "",
    "small_avatar_url": "",
    "created_at": ""
  };
  List groups;

  @override
  void initState() {
    fetch(USER_INFO_URL, onSuccess: _onGetUserInfo);
  }

  _onGetUserInfo(data) {
    setState(() {
      userInfo = data;
    });
    final userId = data["id"];
    final url = '$BASE_URL/users/$userId/groups';
    fetch(url, onSuccess: _onGetGroups);
  }

  _onGetGroups(data) {
    setState(() {
      groups = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    Container buildGroups(groups) {
      bool groupsNull = groups == null;
      if (groupsNull) return buildCardContainer(Container(), height: 100);
      return buildCardContainer(
          Container(
              child: ListView.builder(
                  itemCount: groups.length,
                  itemBuilder: (context, idx) => ListTile(
                        title: Text(groups[idx]["name"]),
                      ))),
          height: 100);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: ListView(
        children: <Widget>[
          UserInfoWidget(userInfo),
          buildGroups(groups),
        ],
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     title: Text(this.title),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: () => _onStartPage(context),
    //     child: Icon(Icons.send),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         Text(
    //           this.title,
    //           style: Theme.of(context).textTheme.display2,
    //         ),
    //         Text(
    //           'this is a content',
    //           style: Theme.of(context).textTheme.display1,
    //         ),
    //         IconButton(
    //           icon: Icon(Icons.send),
    //           onPressed: () => startPage(context, IntroducePage()),
    //           tooltip: 'Go',
    //         )
    //       ],
    //     ),
    //   ),
    // );
  }

  _onStartPage(BuildContext context) {
    startPage(context, InfoPage());
  }
}
