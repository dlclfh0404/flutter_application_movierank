import 'package:flutter/material.dart';
import 'package:flutter_application_movierank/main_api.dart';
import 'package:flutter_application_movierank/rank.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  dynamic body = const Center(
    child: Text(
      '날짜 선택📽',
      style: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 30),
    ),
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('영화랭킹 검색'),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: body,
      floatingActionButton: FloatingActionButton(
        onPressed: showCal,
        child: const Icon(Icons.search),
      ),
    );
  }

  void showCal() async {
    DateTime now = DateTime.now();
    DateTime yesterday = now.subtract(const Duration(days: 1));
    var dt = await showDatePicker(
        context: context,
        initialDate: DateTime(2023, 1, 1),
        firstDate: DateTime(2023),
        lastDate: yesterday);
    String Dt = dt.toString().split(' ')[0].replaceAll('-', '');
    var api = Movie();
    var movies = api.infoMovie(Dt: Dt);

    setState(() {
      body = FutureBuilder(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var Mrank = snapshot.data;
            return ListView.separated(
                itemBuilder: (context, index) {
                  return MovieRank(movie: Mrank[index]);
                },
                separatorBuilder: (context, index) => const Divider(),
                itemCount: Mrank!.length);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      );
    });
  }
}
