import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/page/introduce_page.dart';
import 'package:finchie/widget/card_generator.dart';
import 'package:finchie/widget/repo_widgets.dart' as repoWidgets;
import 'package:finchie/widget/user_info_widget.dart';
import 'package:flutter/material.dart';
import 'package:finchie/page/info_page.dart';

import 'package:finchie/util/common_util.dart';
import 'package:finchie/style/styles.dart' as finchieStyle;

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
  List repos;

  @override
  void initState() {
    fetch(USER_REPOS_URL, onSuccess: _onGetRepos);
  }

  _onGetRepos(data) {
    setState(() {
      repos = data;
    });
  }

  Future<Null> _onRefresh() async {
    await fetch(USER_REPOS_URL, onSuccess: _onGetRepos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text(this.title,
            style: TextStyle(
              fontWeight: FontWeight.w600,
            )),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: repos == null
            ? repoWidgets.emptyRepo
            : repoWidgets.buildRepoList(context, repos),
      ),
      drawer: Drawer(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        tooltip: '新增知识库',
      ),
    );
  }

  _onStartPage(BuildContext context) {
    startPage(context, InfoPage());
  }
}
