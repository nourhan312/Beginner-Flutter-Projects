import 'package:flutter/material.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsDetails extends StatelessWidget {
  final News news;

  NewsDetails({required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewContainer(news.url ?? ""),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  final String url;
  WebViewContainer(this.url);

  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WebViewWidget(controller: _controller),
    );
  }
}
