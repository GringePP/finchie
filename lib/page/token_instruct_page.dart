import 'package:finchie/style/styles.dart';
import 'package:flutter/material.dart';

const titles = ['注册登录', '创建Token', '完成'];

const contents = [
  '访问语雀官网 https://www.yuque.com/',
  '进入“设置”-“Token”-“新建”-“选择授权范围”-创建”',
  '创建完成，将Token复制并粘贴到App内登录'
];

final images = [
  Image.asset('images/register_login.png'),
  Image.asset('images/create_token.png'),
  Image.asset('images/create_finish.png')
];

class TokenInstructPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Token获取指导",
            style: appbarTitleStyle,
          ),
        ),
        body: Container(
          color: Colors.white,
          child: ListView.builder(
            padding: EdgeInsets.all(20),
            itemCount: titles.length,
            itemBuilder: (ctx, idx) => buildStep(
                idx + 1, titles[idx], contents[idx],
                image: images[idx]),
          ),
        ));
  }
}

buildStep(int idx, String title, String content, {Widget image}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      Row(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(),
            height: 40,
            width: 40,
            child: Stack(
              alignment: Alignment.center,
              children: <Widget>[
                CircleAvatar(
                  backgroundColor: Colors.accents[0],
                ),
                Text(
                  idx.toString(),
                  style: TextStyle(color: Colors.white),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10),
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF333333)),
            ),
          )
        ],
      ),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
        child: Text(
          content,
        ),
      ),
      image == null
          ? Container()
          : Padding(
              padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
              child: image,
            ),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 0, 10),
        child: Divider(
          height: 20,
          color: Colors.black38,
        ),
      )
    ],
  );
}
