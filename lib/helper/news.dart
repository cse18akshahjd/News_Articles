import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_articles/model/articles_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<void> getNewsArticle() async {
    var url = Uri.parse('https://api.sampleapis.com/futurama/characters');
    var response = await http.get(url);
    var jsonData = jsonDecode(response.body);
    jsonData.forEach((element) {
      var data = element['sayings'] == null ? "null" : element['sayings'];
     String saying = "";
      for (var i = 0; i < data.length; i++) {
        saying = saying + " " + data[i];
      }
      ArticleModel articleModel = new ArticleModel(
          name: element['name'] == null
              ? "null"
              : element['name']['first'] +
                  " " +
                  element['name']['middle'] +
                  " " +
                  element['name']['last'],
          images:
              element['images'] == null ? "null" : element['images']['main'],
          gender: element['gender'] == null ? "null" : element['gender'],
          species: element['species'] == null ? "null" : element['species'],
          homePlanet:
              element['homePlanet'] == null ? "null" : element['homePlanet'],
          occupation:
              element['occupation'] == null ? "null" : element['occupation'],
          sayings: saying,
          age: element['age'] == null ? "null" : element['age']);
      news.add(articleModel);
    });
  }
}
