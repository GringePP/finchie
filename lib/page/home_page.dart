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
  Map<String, dynamic> userInfo = {
    "name": "",
    "small_avatar_url": "",
    "created_at": ""
  };
  List groups;
  List repos;

  @override
  void initState() {
    super.initState();
    fetchRepos(onSuccess: _onGetRepos);
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
        leading: Icon(Icons.menu),
        title: Text('我的知识库', style: finchieStyle.appbarTitleStyle),
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
}
