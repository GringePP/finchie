import 'package:finchie/util/common_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:finchie/style/text_style.dart' as finchiTextStyle;

class UserInfoWidget extends StatelessWidget {
  UserInfoWidget(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      height: 100,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x22000000),
              offset: Offset(2, 5),
              blurRadius: 10.0,
            ),
          ]),
      child: Row(
        children: <Widget>[
          Container(
            height: 50,
            width: 50,
            // margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundColor: Colors.grey,
              backgroundImage: NetworkImage(
                data["small_avatar_url"],
              ),
              radius: 50,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  data["name"],
                  style: finchiTextStyle.textTitle,
                ),
                Text('加入时间：' + splitTime(data["created_at"])),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
