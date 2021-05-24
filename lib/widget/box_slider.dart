import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluuterandfirebase_app/model_movie/model_movie.dart';
import 'package:fluuterandfirebase_app/screen/detail_screen.dart';

class BoxSlider extends StatelessWidget {
  final List<Movie> movise;

  BoxSlider({this.movise});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('지금 뜨는 컨텐츠'),
          Container(
            height: 120,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: makeSquareImages(context, movise),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> makeSquareImages(BuildContext context, List<Movie> moives) {
  List<Widget> results = [];
  for (var i = 0; i < moives.length; i++) {
    results.add(
      InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
                fullscreenDialog: true,
                builder: (BuildContext context) {
                  return DetailScreen(
                    movie: moives[i],
                  );
                }),
          );
        },
        child: Container(
          padding: EdgeInsets.only(right: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Image.network(moives[i].poster),
          ),
        ),
      ),
    );
  }
  return results;
}
