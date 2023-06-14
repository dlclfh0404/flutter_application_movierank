import 'package:flutter/material.dart';

class RankDetail extends StatelessWidget {
  Map<String, dynamic> movie;
  RankDetail({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieTitle = movie['movieNm'];
    var date = movie['openDt'];
    var rank = movie['rank'];
    return Scaffold(
      appBar: AppBar(
        title: Text('$movieTitle'),
      ),
      body: Column(
        children: [
          Image.asset('images/no-img.jpg'),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text('$movieTitle'),
                  Text('$date'),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
