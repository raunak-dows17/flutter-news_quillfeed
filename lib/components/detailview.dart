// ignore_for_file: must_be_immutable

import "dart:async";

import "package:flutter/material.dart";
import "package:webview_flutter/webview_flutter.dart";

class DetailViewScreen extends StatefulWidget {
  String newsURL;
  String newsTitle;
  DetailViewScreen({super.key, required this.newsURL, required this.newsTitle});

  @override
  State<DetailViewScreen> createState() => _DetailViewScreenState();
}

class _DetailViewScreenState extends State<DetailViewScreen> {
  @override
  void initState() {
    super.initState();
    setState(() {
      widget.newsURL = widget.newsURL.contains("http:")
          ? widget.newsURL.replaceAll("http:", "https:")
          : widget.newsURL;
    });
  }

  final Completer<WebViewController> controller =
      Completer<WebViewController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QuillFeed | ${widget.newsTitle}"),
      ),
        body: WebView(
          initialUrl: widget.newsURL,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          },
        ));
  }
}
