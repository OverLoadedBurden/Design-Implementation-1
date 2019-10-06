import 'package:UIMock/PreviewPage.dart';
import 'package:UIMock/styles.dart';
import 'package:flutter/material.dart';

class PreviewCard extends StatelessWidget {
  final Map data;
  const PreviewCard({Key key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (c) {
          return PreviewPage(
            data: data,
          );
        }));
      },
      child: Hero(
        tag: '$data preview image',
        child: Material(
          color: Colors.white,
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: Duration(milliseconds: 500),
            decoration: BoxDecoration(
                boxShadow: <BoxShadow>[BoxShadow(color: Colors.black)],
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/${data['image']}')),
                borderRadius: BorderRadius.circular(40)),
            height: 180,
            width: 130,
            child: Stack(
              children: <Widget>[
                AnimatedAlign(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 12.0, left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          data['title'],
                          style: Styles.PREVIEWTITLE,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: Text(
                            data['length'],
                            style: Styles.PREVIEWSUB,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                AnimatedAlign(
                  duration: Duration(milliseconds: 500),
                  curve: Curves.easeInOut,
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(90),
                        color: Colors.white60,
                      ),
                      child: IconButton(
                        icon: Icon(
                          Icons.play_arrow,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
