import 'package:UIMock/RecomendedPanel.dart';
import 'package:UIMock/styles.dart';
import 'package:UIMock/TimeSelection.dart';
import 'package:flutter/material.dart';

class PreviewPage extends StatelessWidget {
  final Map<String, String> data;
  PreviewPage({Key key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) => Scaffold(
        // key: Scaffold,
        bottomNavigationBar: buildNavigation(),
        backgroundColor: Colors.white,
        body: Content(
          data: data,
        ),
      );
}

class Content extends StatefulWidget {
  final Map<String, String> data;
  Content({Key key, this.data}) : super(key: key);

  _ContentState createState() => _ContentState();
}

class _ContentState extends State<Content> {
  bool scrolled = false;
  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerMove: (event) {
        setState(() {
          if (event.delta.dy > 10) {
            Navigator.of(context).pop();
          }
          if (event.delta.dy < -10) {
            setState(() {
              scrolled = true;
            });
            showModalBottomSheet(
                    elevation: 20,
                    context: context,
                    builder: (context) => RecomendedSheet(),
                    backgroundColor: Colors.transparent)
                .whenComplete(() {
              setState(() {
              // print('done');
                scrolled = false;
              });
            });
          }
        });
      },
      child: SizedBox.expand(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            ...buildOldHeroes(context),
            Positioned(
              top: 310,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(widget.data['subtitle']),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: TimeSelection(),
                  ),
                  Text('Download meditation', style: Styles.STRONG),
                  Container(
                    width: MediaQuery.of(context).size.width * .9,
                    child: Stack(
                      children: <Widget>[
                        Positioned(
                          top: 10,
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              '${widget.data['size']} MB',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                        ),
                        Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: Icon(
                                Icons.file_download,
                                color: Colors.greenAccent,
                              ),
                              onPressed: () {
                                setState(() {
                                  scrolled = !scrolled;
                                });
                              },
                            )),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  List<Widget> buildOldHeroes(BuildContext context) {
    return <Widget>[
      AnimatedPositioned(
        duration: Duration(milliseconds: 400),
        top: scrolled ? 0 : 90,
        child: Hero(
          tag: '${widget.data} preview image',
          child: Material(
            color: Colors.white,
            child: AnimatedContainer(
              curve: Curves.easeInOut,
              duration: Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                    )
                  ],
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/${widget.data['image']}')),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(scrolled ? 0 : 40),
                      topRight: Radius.circular(scrolled ? 0 : 40),
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40))),
              height: 200,
              width: MediaQuery.of(context).size.width * (scrolled ? 1 : .9),
              child: Stack(
                children: <Widget>[
                  AnimatedAlign(
                    duration: Duration(milliseconds: 500),
                    curve: Curves.easeInOut,
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 12.0, left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          Text(
                            widget.data['title'],
                            style: Styles.PREVIEWTITLE,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 12.0),
                            child: Text(
                              widget.data['length'],
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      Hero(
        tag: 'user icon',
        child: Align(
          alignment: Alignment.topRight,
          child: Padding(
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.amber, borderRadius: BorderRadius.circular(15)),
            ),
            padding: EdgeInsets.all(20),
          ),
        ),
      ),
      Hero(
        tag: 'back button',
        child: Align(
          alignment: Alignment.topLeft,
          child: Material(
            color: Colors.transparent,
            child: Padding(
              child: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              padding: EdgeInsets.all(20),
            ),
          ),
        ),
      ),
    ];
  }
}

///no need to embed it in any class

Widget buildNavigation() {
  return Hero(
    tag: 'bottom navigation',
    child: BottomNavigationBar(
      selectedItemColor: Colors.greenAccent.withAlpha(70),
      unselectedItemColor: Colors.greenAccent.withAlpha(20),
      onTap: (x) {},
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.greenAccent))),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          title: Text(
            'Search',
            style: TextStyle(color: Colors.greenAccent),
          ),
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.mood),
            title: Text('Home', style: TextStyle(color: Colors.greenAccent))),
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home', style: TextStyle(color: Colors.greenAccent)))
      ],
    ),
  );
}
