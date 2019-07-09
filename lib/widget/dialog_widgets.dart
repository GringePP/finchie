import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CommonDialog extends StatelessWidget {
  CommonDialog({this.child, this.barrierDismissible = true});

  final Widget child;
  final bool barrierDismissible;
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Material(
        type: MaterialType.transparency,
        child: Stack(
          children: <Widget>[
            GestureDetector(
              onTap: () => (this.barrierDismissible)
                  ? Navigator.of(context).pop()
                  : null,
            ),
            Center(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10))),
                margin:
                    EdgeInsets.fromLTRB(screenWidth / 6, 0, screenWidth / 6, 0),
                padding: EdgeInsets.all(20),
                constraints: BoxConstraints(minWidth: 100),
                child: child,
              ),
            ),
          ],
        ));
  }
}
