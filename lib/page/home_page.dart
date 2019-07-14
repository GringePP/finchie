import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/widget/repo_widgets.dart' as repoWidgets;
import 'package:flutter/material.dart';

import 'package:finchie/style/styles.dart' as finchieStyle;

class HomePage extends Scaffold {
  @override
  ScaffoldState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ScaffoldState {
  Map<String, dynamic> userInfo;
  List groups;
  List repos;

  @override
  void initState() {
    super.initState();
    fetchRepos(onSuccess: _onGetRepos);
    fetchUserInfo(onSuccess: (res) {
      userInfo = res['data'];
    });
  }

  _onGetRepos(res) {
    setState(() {
      repos = res['data'];
    });
  }

  Future<void> _onRefresh() {
    return fetchRepos(onSuccess: _onGetRepos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的知识库', style: finchieStyle.appbarTitleStyle),
      ),
      body: RefreshIndicator(
        onRefresh: _onRefresh,
        child: repos == null
            ? repoWidgets.emptyRepo
            : repoWidgets.buildRepoList(context, repos),
      ),
      drawer: Drawer(
        child: userInfo == null
            ? CircularProgressIndicator()
            : ListView(
                padding: EdgeInsets.zero,
                children: <Widget>[
                  UserAccountsDrawerHeader(
                    currentAccountPicture: CircleAvatar(
                      backgroundImage:
                          NetworkImage(userInfo["medium_avatar_url"]),
                    ),
                    accountName: Text(userInfo['name']),
                    accountEmail: Text(userInfo['login']),
                  )
                ],
              ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: null,
        tooltip: '新增知识库',
      ),
    );
  }
}
