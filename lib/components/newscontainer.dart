// ignore_for_file: must_be_immutable, file_names

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quillfeed/components/detailview.dart';

class NewsContainer extends StatelessWidget {
  NewsContainer(
      {super.key,
      required this.imageURL,
      required this.newsHeading,
      required this.newsDescription,
      required this.newsCnt,
      required this.newsUrl,
      required this.author,
      required this.date})
      : dateTime = DateTime.parse(date),
        formattedDate =
            DateFormat.yMMMd().add_jm().format(DateTime.parse(date));

  String imageURL;
  String newsHeading;
  String newsDescription;
  String newsCnt;
  String newsUrl;
  String date;
  String author;

  final DateTime dateTime;
  final String formattedDate;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.5,
            child: FadeInImage.assetNetwork(
                fit: BoxFit.cover,
                placeholder: "assets/img/logo.png",
                image: imageURL),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width,
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                newsHeading,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Text(
                  "published at $formattedDate",
                  style: const TextStyle(
                    color: Color.fromARGB(255, 175, 126, 232),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  "~by $author",
                  textAlign: TextAlign.end,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ]),
              const SizedBox(
                height: 5,
              ),
              Text(
                newsDescription,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black38,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                newsCnt.length >= 16
                    ? "${newsCnt.substring(0, newsCnt.length - 14)}..."
                    : newsCnt,
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ]),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(255, 216, 198, 236),
                  )),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailViewScreen(
                                  newsURL: newsUrl,
                                  newsTitle: newsHeading,
                                )));
                  },
                  child: const Text(
                    "Read More",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
