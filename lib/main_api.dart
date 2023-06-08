import 'dart:convert';

import 'package:http/http.dart' as http;

class Movie {
  String api_key = 'd14ac539587c46a3421ee909edbf9a45';

  Future<List<dynamic>> infoMovie({required String Dt}) async {
    String site =
        'http://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=$api_key&targetDt=$Dt';
    var response = await http.get(Uri.parse(site));
    if (response.statusCode == 200) {
      var movies = jsonDecode(response.body)['boxOfficeResult']
          ['dailyBoxOfficeList'] as List<dynamic>;
      return movies;
    } else {
      return [];
    }
  }
}
//boxOfficeResult.dailyBoxOfficeList