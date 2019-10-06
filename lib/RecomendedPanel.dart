import 'package:UIMock/RecomendedTile.dart';
import 'package:UIMock/Shared%20Data.dart';
import 'package:flutter/material.dart';

class RecomendedSheet extends StatefulWidget {
  final VoidCallback onTap;
  final bool modal;
  const RecomendedSheet({Key key, this.modal, this.onTap}) : super(key: key);

  @override
  _RecomendedSheetState createState() => _RecomendedSheetState();
}

class _RecomendedSheetState extends State<RecomendedSheet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height*.75,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(40), topLeft: Radius.circular(40)),
          color: Colors.grey.shade200),
          // color: Colors.greenAccent),
      child: Column(
        children: <Widget>[
          InkWell(
              onTap: widget.onTap,
              child: Container(
                padding: EdgeInsets.only(top: 20, bottom: 50),
                width: 50,
                child: CustomPaint(
                  painter: LinePainter(),
                ),
              ),
            ),
          Flexible(
                      child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  for (var i = 0; i < SharedData.RECOMENDATIONS.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: buildItems(context, i),
                    )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildItems(BuildContext context, int i) {
    return RecomendedTile(
      vars: SharedData.RECOMENDATIONS[i],
    );
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint p = Paint()
      ..color = Colors.grey
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    var y = size.height / 2;
    canvas.drawLine(Offset(0, y), Offset(size.width, y), p);
  }

  @override
  bool shouldRepaint(LinePainter oldDelegate) => false;

  @override
  bool shouldRebuildSemantics(LinePainter oldDelegate) => false;
}
