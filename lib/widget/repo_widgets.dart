import 'package:finchie/style/styles.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

final emptyRepo = Center(
  child: Text(
    '知识库为空',
    style: TextStyle(
        fontSize: 25, fontWeight: FontWeight.w600, color: Colors.grey[500]),
  ),
);

buildRepoList(BuildContext context, dynamic repos) {
  return ListView.builder(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      itemCount: repos.length,
      itemBuilder: (ctx, idx) => Card(
          elevation: 2.5,
          child: InkWell(
            onTap: () => Fluttertoast.showToast(msg: repos[idx]["name"]),
            onLongPress: () => showDialog(
                context: context,
                builder: (ctx) => AlertDialog(
                      title: Text(repos[idx]["name"]),
                      content: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("id: " + repos[idx]["id"].toString()),
                          Text("namespace: " + repos[idx]["namespace"]),
                          Text("item counts: " +
                              repos[idx]["items_count"].toString()),
                          Text("watches count: " +
                              repos[idx]["watches_count"].toString()),
                          Text("public: " + repos[idx]["public"].toString()),
                        ],
                      ),
                    )),
            child: ListTile(
              leading: Stack(
                alignment: Alignment.center,
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: randomColor(),
                  ),
                  Text(
                    repos[idx]["name"][0],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  )
                ],
              ),
              title: Text(
                repos[idx]["name"],
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                repos[idx]["description"],
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ))).build(context);
}
