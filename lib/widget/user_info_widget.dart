import 'package:finchie/util/common_util.dart';
import 'package:finchie/widget/card_generator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:finchie/style/text_style.dart' as finchiTextStyle;

class UserInfoWidget extends StatelessWidget {
  UserInfoWidget(this.data);

  final data;

  @override
  Widget build(BuildContext context) {
    return buildCardContainer(
        Row(
          children: <Widget>[
            Container(
              height: 60,
              width: 60,
              child: CircleAvatar(
                backgroundColor: Colors.grey[500],
                backgroundImage: NetworkImage(
                  data["small_avatar_url"],
                ),
                radius: 60,
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
        height: 100);
  }
}
