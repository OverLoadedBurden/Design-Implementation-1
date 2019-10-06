import 'dart:async';

import 'package:UIMock/styles.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class TopSheet extends StatefulWidget {
  const TopSheet({Key key}) : super(key: key);

  @override
  _TopSheetState createState() => _TopSheetState();
}

class _TopSheetState extends State<TopSheet> {
  var _images;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _images = _getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Material(
        color: Colors.transparent,
        child: Hero(
          tag: 'back button',
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              child: Icon(Icons.menu),
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
      Material(
        color: Colors.transparent,
        child: Hero(
          tag: 'user icon',
          child: Align(
            alignment: Alignment.topRight,
            child: Padding(
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(15)),
              ),
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
      Align(
        alignment: Alignment.centerLeft,
        child: Padding(
          padding: EdgeInsets.only(top: 50, left: 60),
          child: buildTitle(context),
        ),
      )
    ]);
  }

  Stream<ui.Image> _getImage() {
    var controller = StreamController<ui.Image>();
    new AssetImage('assets/b.gif')
        .resolve(new ImageConfiguration())
        .addListener(ImageStreamListener((info, _) {
      controller.add(info.image);
    }));
    return controller.stream;
  }

  @override
  Widget buildTitle(BuildContext context) {
    return StreamBuilder<ui.Image>(
      stream: _images,
      builder: (context, data) {
        if (data.data == null)
          return Text(
            'Good\nMorning',
            style: Styles.TITLE,
          );
        return ShaderMask(
          child: Text(
            "Good\nMorning",
            style: Styles.TITLE,
          ),
          blendMode: BlendMode.srcATop,
          shaderCallback: (bounds) {
            return ui.ImageShader(
              data.data,
              TileMode.repeated,
              TileMode.repeated,
              Matrix4.identity().storage,
            );
          },
        );
      },
    );
  }
}
