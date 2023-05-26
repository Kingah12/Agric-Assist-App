import 'dart:convert';

import 'package:agro_assist/model/news_model.dart';
import 'package:http/http.dart' as http;

class NewsData {
  List<NewsArticle> news = [];

  Future<void> getNewsArticle() async {
    String newsApiKey = "0e9af026cd5d42b8a45717b4d5c10387";
    String news1ApiKey = "1b74d332f1c74c65aa2a66efdc054229";
    late String url =
        "https://newsapi.org/v2/top-headlines?country=ng&category=general&apiKey=$news1ApiKey";
    http.Response response = await http.get(Uri.parse(url));
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

class CategoryNewsData {
  List<NewsArticle> news = [];

  Future<void> getCategoryNewsArticle(String agroCategory) async {
    String newsApiKey = "0e9af026cd5d42b8a45717b4d5c10387";
    String news1ApiKey = "1b74d332f1c74c65aa2a66efdc054229";
    late String url =
        "https://newsapi.org/v2/top-headlines?country=ng&category=$agroCategory&apiKey=$news1ApiKey";
    http.Response response = await http.get(Uri.parse(url));
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
