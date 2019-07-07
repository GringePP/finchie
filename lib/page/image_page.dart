import 'package:flutter/material.dart';
import 'package:flutter_drag_scale/flutter_drag_scale.dart';

class ImagePage extends StatelessWidget {
  ImagePage({@required this.image});

  final Image image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        color: Color(0xFF333333),
        child: DragScaleContainer(
          doubleTapStillScale: false,
          child: image,
        ),
      ),
    );
  }
}
