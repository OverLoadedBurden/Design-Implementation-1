import 'package:UIMock/styles.dart';
import 'package:flutter/material.dart';

class TimeSelection extends StatefulWidget {
  TimeSelection({Key key}) : super(key: key);

  _TimeSelectionState createState() => _TimeSelectionState();
}

class _TimeSelectionState extends State<TimeSelection> {
  int selected = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text(
          'Select the time',
          style: Styles.STRONG,
        ),
        Container(
          width: MediaQuery.of(context).size.width * .9,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Stack(
              children: <Widget>[
                for (var i = 0; i < 3; i++) switchableButton(i)
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget switchableButton(int i) {
    int len = 0;
    var align;
    switch (i) {
      case 0:
        len = 5;
        align = Alignment.centerLeft;
        break;
      case 1:
        len = 3;
        align = Alignment.center;
        break;
      case 2:
        len = 1;
        align = Alignment.centerRight;
        break;
    }
    return Align(
      alignment: align,
      child: GestureDetector(
        onTap: () {
          if (i != selected)
            setState(() {
              selected = i;
            });
        },
        child: AnimatedContainer(
          padding: EdgeInsets.all(10),
          duration: Duration(milliseconds: 200),
          curve: Curves.linear,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: i == selected
                  ? Colors.greenAccent.shade200
                  : Colors.grey.shade100),
          child: Text(
            '   0$len:00   ',
            style: TextStyle(color: i == selected ? Colors.white : Colors.grey),
          ),
        ),
      ),
    );
  }
}
