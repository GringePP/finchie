import 'package:finchie/network/yuque_api.dart';
import 'package:flutter/material.dart';
import 'package:finchie/widget/repo_widgets.dart' as repoWidgets;

class RepoPage extends StatefulWidget {
  RepoPage(this.namespace, {this.name});

  final namespace;
  final name;

  @override
  State<StatefulWidget> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  List docs;
  List<Future> futureList = List();

  @override
  void initState() {
    Future f = fetchDocs(widget.namespace, onSuccess: _onGetDocs);
    futureList.add(f);
  }

  _onGetDocs(data) {
    setState(() {
      docs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name ?? widget.namespace,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        body: docs == null
            ? repoWidgets.emptyRepo
            : repoWidgets.buildDocList(context, docs));
  }
}
