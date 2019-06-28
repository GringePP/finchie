import 'package:finchie/page/introduce_page.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onStartPage(context),
        child: Icon(Icons.send),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              this.title,
              style: Theme.of(context).textTheme.display2,
            ),
            Text(
              'this is a content',
              style: Theme.of(context).textTheme.display1,
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () => startPage(context, IntroducePage()),
              tooltip: 'Go',
            )
          ],
        ),
      ),
    );
  }

  _onStartPage(BuildContext context) {
    startPage(context, InfoPage());
  }
}
