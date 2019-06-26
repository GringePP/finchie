import 'package:flutter/material.dart';

class FinchieAppbar extends StatefulWidget {

  FinchieAppbar({this.title});

  final String title;

  @override
  State<StatefulWidget> createState() => _FinchieAppbarState();
}

class _FinchieAppbarState extends State<FinchieAppbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56,
      decoration: BoxDecoration(
          color: Colors.blue,
          boxShadow: <BoxShadow>[BoxShadow(color: Colors.grey, spreadRadius: 2, blurRadius: 5)],
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))),
      padding: EdgeInsets.all(10),
      child: Row(
        children: <Widget>[
          IconButton(icon: Icon(Icons.menu), onPressed: null),
          Expanded(child: Text(widget.title)),
          IconButton(icon: Icon(Icons.search), onPressed: ()=>{debugPrint("asdsadads")}, tooltip: 'Search',)
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
