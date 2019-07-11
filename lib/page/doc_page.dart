import 'package:finchie/network/yuque_api.dart';
import 'package:finchie/widget/doc_widgets.dart';
import 'package:flutter/material.dart';
import 'package:finchie/style/styles.dart' as finchieStyle;

class DocPage extends StatefulWidget {
  DocPage(this.namespace, this.id, {this.title});

  final namespace;
  final id;
  final title;

  @override
  State<StatefulWidget> createState() => _DocPageState();
}

class _DocPageState extends State<DocPage> {
  Map<String, dynamic> doc;

  @override
  void initState() {
    super.initState();
    fetchDoc(widget.namespace, widget.id, onSuccess: _onGetDoc);
  }

  _onGetDoc(res) {
    setState(() {
      doc = res['data'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).primaryColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: doc == null
          ? Center(
              child: Text("载入中..."),
            )
          : Container(
              color: Colors.white,
              constraints: BoxConstraints.expand(),
              child: ListView(
                padding: EdgeInsets.all(18),
                children: <Widget>[
                  buildDocHeader(context, doc),
                  buildDocBody(doc)
                ],
              ),
            ),
    );
  }
}
