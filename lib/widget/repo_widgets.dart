import 'package:finchie/style/styles.dart';
import 'package:finchie/util/common_util.dart';
import 'package:finchie/widget/card_generator.dart';
import 'package:flutter/material.dart';
import 'package:finchie/page/repo_page.dart';
import 'package:finchie/page/doc_page.dart';

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
            onTap: () => startPage(
                context,
                RepoPage(
                  repos[idx]["namespace"],
                  name: repos[idx]["name"],
                )),
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
                    backgroundColor: Colors.grey[500],
                  ),
                  Text(
                    repos[idx]["name"][0],
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 22),
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

buildDocList(BuildContext context, dynamic docs, String namespace) {
  return ListView.builder(
      padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
      itemCount: docs.length,
      itemBuilder: (ctx, idx) => Card(
            elevation: 2.5,
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: () => startPage(
                  context,
                  DocPage(
                    namespace,
                    docs[idx]["id"],
                    title: docs[idx]["title"],
                  )),
              child: Container(
                child: Column(
                  children: <Widget>[
                    Container(
                      color: Colors.grey[500],
                      padding: EdgeInsets.all(10),
                      constraints: BoxConstraints.expand(
                        height: 120,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            docs[idx]["title"],
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 5),
                            child: Text(
                              docs[idx]["description"],
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13),
                              overflow: TextOverflow.ellipsis,
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      constraints: BoxConstraints.expand(height: 50),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.star,
                                  color: Colors.grey[500],
                                ),
                                tooltip: '点赞数',
                              ),
                              Text(docs[idx]["likes_count"].toString())
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.comment,
                                  color: Colors.grey[500],
                                ),
                                tooltip: '评论数',
                              ),
                              Text(docs[idx]["comments_count"].toString())
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              IconButton(
                                onPressed: () => {},
                                icon: Icon(
                                  Icons.code,
                                  color: Colors.grey[500],
                                ),
                                tooltip: '字数',
                              ),
                              Text(docs[idx]["word_count"].toString())
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ));
}
