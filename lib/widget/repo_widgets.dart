import 'package:finchie/style/styles.dart';
import 'package:flutter/material.dart';

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
          child: GestureDetector(
            onTap: () => {},
            onLongPress: () => {},
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
