import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/util/login_util.dart';
import 'package:finchie/widget/no_login_widget.dart';
import 'package:finchie/widget/repo_widgets.dart' as repoWidgets;
import 'package:flutter/material.dart';
import 'package:finchie/page/setting_page.dart';
import 'package:finchie/constant/constant.dart';

import 'package:finchie/style/styles.dart' as finchieStyle;

class HomePage extends Scaffold {
  @override
  ScaffoldState createState() {
    return _HomePageState();
  }
}

class _HomePageState extends ScaffoldState {
  Map<String, dynamic> userInfo;
  List repos;
  bool isLogin = false;

  @override
  void initState() {
    super.initState();
    // check login state.
    checkLogin().then((info) {
      if (info != null) {
        updateToken(info["token"]);
        updateUserId(info["user_id"]);
        setState(() {
          isLogin = true;
        });

        // fetch repos and user info
        fetchRepos(onSuccess: _onGetRepos);
        fetchUserInfo(onSuccess: _onGetUserInfo);
      }
    });
  }

  _onLogin() {
    setState(() {
      isLogin = true;
    });
    fetchRepos(onSuccess: _onGetRepos);
    fetchUserInfo(onSuccess: _onGetUserInfo);
  }

  _onGetUserInfo(res) {
    setState(() {
      userInfo = res['data'];
    });
  }

  _onGetRepos(res) {
    setState(() {
      repos = res['data'];
    });
  }

  Future<void> _onRefresh() {
    if (!isLogin) return Future(() {});
    return fetchRepos(onSuccess: _onGetRepos);
  }

  _onSetting() {
    // start a setting page, and listen on its return message, such as logout event and so on.
    startPage(context, SettingPage()).then((msg) {
      switch (msg) {
        case LOGOUT:
          setState(() {
            isLogin = false;
            userInfo = null;
            repos = null;
          });
          break;
        default:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLogin
        ? Scaffold(
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
                  ? SizedBox(
                      height: 50,
                      width: 50,
                      child: CircularProgressIndicator(),
                    )
                  : ListView(
                      padding: EdgeInsets.zero,
                      children: <Widget>[
                        UserAccountsDrawerHeader(
                          currentAccountPicture: CircleAvatar(
                            backgroundImage:
                                NetworkImage(userInfo["medium_avatar_url"]),
                          ),
                          accountName: Text(
                            userInfo['name'],
                            overflow: TextOverflow.ellipsis,
                          ),
                          accountEmail:
                              Text('ID: ' + userInfo['id'].toString()),
                        ),
                        ListTile(
                          leading: Icon(Icons.settings),
                          title: Text('设置'),
                          onTap: _onSetting,
                        )
                      ],
                    ),
            ),
            floatingActionButton: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: null,
              tooltip: '新增知识库',
            ),
          )
        : NoLoginWidget(
            callback: (msg) {
              // here, all we need to do is to update the state as the login manipulation has been done in the login page, such as persist the token and userid.
              if (msg == LOGIN) {
                _onLogin();
              }
            },
          );
  }
}
