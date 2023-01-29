import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/news.dart';

Future<List<News>?> getNews() async {
  var url = 'http://www.mocky.io/v2/5ecfddf13200006600e3d6d0';
  var response = await http.get(Uri.parse(url));
  var news = <News>[];

  if (response.statusCode == 200) {
    var newsJson=jsonDecode(response.body);
    for(var newsJson in newsJson){
      news.add(News.fromJson(newsJson));
    }
  }
  return news;
}
