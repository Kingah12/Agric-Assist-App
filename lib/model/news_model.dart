class NewsArticle {
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  String publishedAt;
  String content;
  NewsArticle(
      {required this.author,
      required this.title,
      required this.description,
      required this.url,
      required this.urlToImage,
      required this.publishedAt,
      required this.content});
}

class AgroNewsArticle {
  int position;
  String link;
  String title;
  String source;
  String date;
  String snippet;
  String thumbnail;

  AgroNewsArticle(
      {required this.position,
      required this.link,
      required this.title,
      required this.source,
      required this.date,
      required this.snippet,
      required this.thumbnail});
}
