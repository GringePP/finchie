import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  UserInfoWidget(this.data);

  var data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Color(0x22000000),
              offset: Offset(2, 10),
              blurRadius: 10.0,
            ),
          ]),
      child: Row(
        children: <Widget>[
          Container(
            // margin: EdgeInsets.all(10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                data["avatarUrl"],
              ),
              radius: 100,
            ),
          ),
          Expanded(child: Text(data["name"]))
        ],
      ),
    );
  }
}
