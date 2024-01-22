import "package:flutter/material.dart";
import "package:quillfeed/controllers/fetchNews.dart";
import "package:quillfeed/model/newsModel.dart";
import "../components/NewsContainer.dart";

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isLoading = true;

  late NewsArt newsArt;

  getNews() async {
    newsArt = await FetchNews.fetchNews();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          scrollDirection: Axis.vertical,
          onPageChanged: (value) => {
                setState(() {
                  isLoading = true;
                }),
                getNews(),
              },
          itemBuilder: (context, index) {
            return isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : NewsContainer(
                    imageURL: newsArt.imgURL,
                    newsHeading: newsArt.title,
                    newsDescription: newsArt.desc,
                    newsUrl: newsArt.sourceURL,
                    author: newsArt.author,
                    newsCnt: newsArt.cont,
                    date: newsArt.date,
                  );
          }),
    );
  }
}
