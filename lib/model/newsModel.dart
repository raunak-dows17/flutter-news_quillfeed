class NewsArt {
  String imgURL;
  String title;
  String desc;
  String cont;
  String author;
  String sourceURL;
  String date;

  NewsArt({
    required this.imgURL,
    required this.title,
    required this.desc,
    required this.cont,
    required this.author,
    required this.sourceURL,
    required this.date,
  });

  static NewsArt apiToApp(Map<String, dynamic> article) {
    return NewsArt(
      imgURL: article["urlToImage"] ??
          "https://images.unsplash.com/photo-1583774139366-a903e7bc5236?q=80&w=2025&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      title: article["title"] ?? "No Title... 😢",
      desc: article["description"] ?? "No Description... 😢",
      cont: article["content"] ?? "No Content... 😢               ",
      author: article["author"] ?? "unknown",
      sourceURL: article["url"] ??
          "https://news.google.com/home?hl=en-IN&gl=IN&ceid=IN:en",
          date: article["publishedAt"] ?? "-- -- ---- 😢"
    );
  }
}
