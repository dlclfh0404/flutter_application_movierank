import 'package:flutter/material.dart';
import 'package:flutter_application_movierank/rank_detail.dart';

class MovieRank extends StatelessWidget {
  Map<String, dynamic> movie;
  MovieRank({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    var movieTitle = movie['movieNm'];
    var moviebox = movie['boxofficeType'];
    var date = movie['openDt'];
    var rank = movie['rank'];
    return GestureDetector(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => RankDetail(
                  movie: movie,
                ),
              ));
        },
        child: Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              SizedBox(
                width: 200,
                height: 200,
                child: Image.asset('images/no-img.jpg'),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$movieTitle',
                      style: const TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    Text('랭킹 : $rank위'),
                    Text('개봉일 : $date'),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
