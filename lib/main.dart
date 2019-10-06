import 'package:UIMock/PreviewCard.dart';
import 'package:UIMock/RecomendedPanel.dart';
import 'package:UIMock/Shared%20Data.dart';
import 'package:UIMock/top.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'UIMock #1',
      home: Scaffold(
          backgroundColor: Colors.white,
          body: SizedBox.expand(
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[TopSheet(), buildPreviewCards(context)],
                ),
                AnimatedRecommendations()
              ],
            ),
          ),
          bottomNavigationBar: buildNavigation()),
    );
  }

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

  Widget buildPreviewCards(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      // controller: controller,
      child: Row(
        children: <Widget>[
          for (var i = 0; i < 3; i++)
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: PreviewCard(
                  data: SharedData.PREVIEWDATA[i],
                ),
              ),
            )
        ],
      ),
    );
  }
}

class AnimatedRecommendations extends StatefulWidget {
  AnimatedRecommendations({Key key}) : super(key: key);

  _AnimatedRecommendationsState createState() =>
      _AnimatedRecommendationsState();
}

class _AnimatedRecommendationsState extends State<AnimatedRecommendations> {
  bool showed = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      bottom: showed ? 0 : 40 - MediaQuery.of(context).size.height * .75,
      duration: Duration(milliseconds: 500),
      curve: Curves.elasticInOut,
      child: RecomendedSheet(
        onTap: () {
          setState(() {
            showed = !showed;
          });
        },
      ),
    );
  }
}
