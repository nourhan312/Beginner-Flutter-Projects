import 'package:flutter/material.dart';
import 'package:news_app/APIs/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/news/newsItem.dart';
import '../../model/NewsResponse.dart';

class NewsWidget extends StatefulWidget {
  final Source source;
  NewsWidget({required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  late Future<Map<String, dynamic>> _newsFuture;

  @override
  void initState() {
    super.initState();
    _fetchNews();
  }

  void _fetchNews() {
    setState(() {
      _newsFuture = ApiManager.getNews(widget.source.id ?? "");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<Map<String, dynamic>>(
        future: _newsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: Colors.blue));
          } else if (snapshot.hasError || snapshot.data?["status"] == "error") {
            return _buildErrorWidget();
          }

          final articles = snapshot.data?["articles"] ?? [];
          if (articles.isEmpty) {
            return Center(child: Text("No articles available"));
          }

          var newsResponse = NewsResponse.fromJson(snapshot.data!);
          var newsList = newsResponse.articles ?? [];

          return ListView.builder(
            itemCount: newsList.length,
            itemBuilder: (context, index) {
              var article = newsList[index];
              return ListTile(
                title: Text(article.title ?? ""),
                subtitle: Text(article.author ?? "Unknown"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NewsItem(newsList: newsList, isSelected: true),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildErrorWidget() {
    return Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Icon(Icons.error, color: Colors.red, size: 50),
    SizedBox(height: 10),
    Text("Failed to fetch data. Please check your connection or API limits.", textAlign: TextAlign.center),
    SizedBox(height: 20),
          ElevatedButton(
            onPressed: _fetchNews,
            style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12)),
            child: const Text("Try Again"),
          ),
        ],
        ),
    );
  }
}