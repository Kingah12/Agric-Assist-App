import 'dart:convert';

import 'package:http/http.dart' as http;

import '../news_model.dart';

///
///agric news datas

class AgroNewsData {
  List<AgroNewsArticle> agricNews = [];
  Future<void> getAgricNewsArticle() async {
    // String newsApiKey = "0e9af026cd5d42b8a45717b4d5c10387";

    String agricNewsApiKey =
        "3837d6994fefdbf0b0fb80cc0b495b0e85cd6aa516c4c30e13db899a2b5bb97b";
    late String urlAgricNews =
        "https://serpapi.com/search.json?q=${"latest news on agriculture in Nigeria"}&tbm=nws&location=Nigeria&apikey=$agricNewsApiKey";

    http.Response response = await http.get(Uri.parse(urlAgricNews));
    var jsonData = jsonDecode(response.body);
    if (jsonData['search_metadata']['status'] == 'Success') {
      print(response.body);
      // search_metadata.status
      jsonData['news_results'].forEach((e) {
        if (e['thumbnail'] != null && e['snippet'] != null) {
          AgroNewsArticle agroNewsArticle = AgroNewsArticle(
            position: e['position'],
            link: e['link'],
            title: e['title'],
            source: e['source'],
            date: e['date'],
            snippet: e['snippet'],
            thumbnail: e['thumbnail'],
          );
          agricNews.add(agroNewsArticle);
        }
      });
    }
  }
}

class AgricCategoryNewsData {
  List<NewsArticle> news = [];

  Future<void> getCategoryNewsArticle(String agroCategory) async {
    String newsApiKey = "0e9af026cd5d42b8a45717b4d5c10387";
    String news1ApiKey = "1b74d332f1c74c65aa2a66efdc054229";
    late String url =
        "https://newsapi.org/v2/top-headlines?country=ng&category=$agroCategory&apiKey=$news1ApiKey";

    http.Response response = await http.get(Uri.parse(news1ApiKey));
    var jsonData = jsonDecode(response.body);
    if (jsonData['status'] == 'ok') {
      jsonData['articles'].forEach((e) {
        if (e['urlToImage'] != null && e['description'] != null) {
          NewsArticle newsArticle = NewsArticle(
              author: e['author'],
              title: e['title'],
              description: e['description'],
              url: e['url'],
              urlToImage: e['urlToImage'],
              publishedAt: e['publishedAt'],
              content: e['content']);
          news.add(newsArticle);
        }
      });
    }
  }
}
