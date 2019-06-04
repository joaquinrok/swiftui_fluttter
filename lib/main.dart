import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var landmarks = [
      Landmark("Turtle Rock", "assets/1.jpg", isFavorite: true),
      Landmark("Silver Slamon Creek", "assets/2.jpg"),
      Landmark("Chilkoot Trail", "assets/3.jpg", isFavorite: true),
      Landmark("St. Mary Lake", "assets/4.jpg", isFavorite: true),
      Landmark("Twin Lake", "assets/5.jpg"),
      Landmark("Lake McDonald", "assets/6.jpg"),
      Landmark("Charley Rivers", "assets/7.jpg"),
      Landmark("Icy Bay", "assets/8.jpg"),
      Landmark("Rainbow Lake", "assets/9.jpg"),
      Landmark("Hidden Lake", "assets/10.jpg"),
      Landmark("Chincoteague", "assets/11.jpg"),
    ];

    return CupertinoApp(
      title: 'Flutter Demo',
      theme: CupertinoThemeData(),
      home: HomeScreen(landmarks),
    );
  }
}

// YOU CAN SWAP THE HOME SCREEN FOR THIS ONE TO SEE THE ROUGH VERSION
// class BasicHomeScreen extends StatelessWidget {

//   final List<Landmark> landmarks;

//   BasicHomeScreen(this.landmarks, {Key key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CupertinoPageScaffold(
//       navigationBar: CupertinoNavigationBar(
//         middle: Text("Landmarks"),
//       ),
//       child: Container(
//         child:
//         ListView( children: landmarks.map((landmark) {
//           return Row( children: <Widget>[
//             Image.asset(landmark.thumbnail),
//             Text(landmark.name),
//             Spacer(),

//             landmark.isFavorite ? Image.asset("assets/star.png"): SizedBox.shrink(),
//         ],);}).toList()),
//       ),
//     );
//   }
// }

class HomeScreen extends StatelessWidget {
  final List<Landmark> landmarks;

  HomeScreen(this.landmarks, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        child: CustomScrollView(
      slivers: <Widget>[
        const CupertinoSliverNavigationBar(
          largeTitle: Text("Landmarks"),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((c, i) {
            var landmark = landmarks[i];
            return Container(
                padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                child: Row(
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(right: 10),
                        child: Image.asset(
                          landmark.thumbnail,
                          width: 52,
                        )),
                    Text(landmark.name),
                    Spacer(),
                    () {
                      return landmark.isFavorite
                          ? Image.asset(
                              "assets/star.png",
                              width: 28,
                            )
                          : SizedBox.shrink();
                    }(),
                    Image.asset(
                      "assets/right_chevron.png",
                      width: 8,
                    ),
                  ],
                ));
          }, childCount: landmarks.length),
        ),
      ],
    ));
  }
}

class Landmark {
  final String name;
  String thumbnail;
  final bool isFavorite;
  Landmark(this.name, this.thumbnail, {this.isFavorite = false});
}
