// ignore_for_file: file_names

import "dart:convert";
import "dart:math";

import "package:http/http.dart";
import "package:quillfeed/model/newsModel.dart";

class FetchNews {
  static List sourcesId = [
    "abc-news",
    "bbc-news",
    "bbc-sport",
    "business-insider",
    "engadget",
    "entertainment-weekly",
    "espn",
    "espn-cric-info",
    "financial-post",
    "fox-news",
    "fox-sports",
    "globo",
    "google-news",
    "google-news-in",
    "medical-news-today",
    "national-geographic",
    "news24",
    "new-scientist",
    "new-york-magazine",
    "next-big-future",
    "techcrunch",
    "techradar",
    "the-hindu",
    "the-wall-street-journal",
    "the-washington-times",
    "time",
    "usa-today",
  ];

  static Future<NewsArt> fetchNews() async {
    final random = Random();
    var randomSource = sourcesId[random.nextInt(sourcesId.length)];

    Response res = await get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?sources=$randomSource&apiKey=a9bc56eb46fe4c25a40f87e9c617dda9"));

    Map data = jsonDecode(res.body);

    List articles = data["articles"];
    final random0 = Random();
    var randomArticle = articles[random0.nextInt(articles.length)];

    return NewsArt.apiToApp(randomArticle);
  }
}
