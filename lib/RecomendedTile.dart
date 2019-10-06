import 'package:UIMock/styles.dart';
import 'package:flutter/material.dart';

class RecomendedTile extends StatelessWidget {
  final Map<String, String> vars;
  const RecomendedTile({Key key, this.vars}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/${vars['image']}'),
                  fit: BoxFit.cover),
                  borderRadius: BorderRadius.circular(40)),
              height: 110,
              width: 110,
            ),
            Padding(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    vars['title'],
                    style: Styles.RTHS,
                  ),
                  Text(
                    vars['subtitle'],
                    style: Styles.RTSS,
                  ),
                ],
              ),
              padding: EdgeInsets.only(left: 20),
            )
          ],
        ),
      ),
      onTap: () {},
      splashColor: Colors.tealAccent.shade200,
    );
  }
}
