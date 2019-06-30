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
      if (groupsNull) return buildCardContainer(Container());
      List<Widget> listItems = [];
      for (var group in groups) {
        listItems.add(ListTile(
          title: Text(
            group["name"],
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            group["description"] ?? "No description",
          ),
          leading: Container(
            width: 30,
            height: 30,
            child: CircleAvatar(
              backgroundImage: NetworkImage(group["avatar_url"]),
              backgroundColor: Colors.grey[500],
            ),
          ),
        ));
      }
      return buildCardContainer(
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: listItems,
          ),
          padding: EdgeInsets.all(5));
    }

    Container buildTitle(String label) {
      return Container(
        margin: EdgeInsets.only(left: 10, top: 10),
        child: Text(
          label,
          style: TextStyle(
              color: Colors.accents[0],
              fontWeight: FontWeight.w800,
              fontSize: 22),
          textAlign: TextAlign.start,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(this.title),
      ),
      body: ListView(
        children: <Widget>[],
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
      ),
    );
  }

  _onStartPage(BuildContext context) {
    startPage(context, InfoPage());
  }
}
