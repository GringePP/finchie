import 'package:finchie/network/yuque_api.dart';
import 'package:flutter/material.dart';
import 'package:finchie/widget/repo_widgets.dart' as repoWidgets;
import 'package:finchie/style/styles.dart' as finchieStyle;

class RepoPage extends StatefulWidget {
  RepoPage(this.namespace, {this.name});

  final namespace;
  final name;

  @override
  State<StatefulWidget> createState() => _RepoPageState();
}

class _RepoPageState extends State<RepoPage> {
  List docs;

  @override
  void initState() {
    super.initState();
    fetchDocs(widget.namespace, onSuccess: _onGetDocs);
  }

  _onGetDocs(res) {
    setState(() {
      docs = res['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.name ?? widget.namespace,
            style: finchieStyle.appbarTitleStyle,
          ),
        ),
        body: docs == null || docs.length == 0
            ? repoWidgets.emptyRepo
            : repoWidgets.buildDocList(context, docs, widget.namespace));
  }
}
