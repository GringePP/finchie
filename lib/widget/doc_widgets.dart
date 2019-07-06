import 'package:finchie/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

buildDocHeader(doc) {
  const indicateColor = Color(0xFF666666);
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Padding(
        padding: EdgeInsets.only(bottom: 35),
        child: Text(
          doc["title"],
          style: docTitle,
        ),
      ),
      Row(
        children: <Widget>[
          Icon(
            Icons.book,
            color: indicateColor,
            size: 20,
          ),
          Expanded(
            child: Text(
              doc["book"]["name"],
              style: TextStyle(color: indicateColor),
            ),
          ),
          IconButton(
            icon: Icon(Icons.info),
            color: indicateColor,
            onPressed: () => {},
            tooltip: "关于",
            iconSize: 20,
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        child: Divider(
          color: Colors.grey,
        ),
      )
    ],
  );
}

buildDocBody(doc) {
  return Container(
    child: Html(
      data: doc["body_html"]
    ),
  );
}
