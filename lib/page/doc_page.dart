import 'package:finchie/network/yuque_api.dart';
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

  _onGetDoc(data) {
    setState(() {
      doc = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title ?? widget.id.toString(),
          style: finchieStyle.appbarTitleStyle,
        ),
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
              padding: EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 30),
                    child: Text(
                      doc["title"],
                      style: finchieStyle.docTitle,
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
