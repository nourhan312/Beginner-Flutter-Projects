import 'dart:async';
import 'package:flutter/material.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/news/newsItem.dart';
import '../../../APIs/api_manager.dart';
import '../../../model/NewsResponse.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Source> sourcesList;

  SourceTabWidget({required this.sourcesList, Key? key}) : super(key: key);

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  Map<String, Future<Map<String, dynamic>>> _newsFutures = {};
  List<Source> _sourcesList = [];
  static const int _maxConcurrentRequests = 3;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: widget.sourcesList.length, vsync: this);
    _sourcesList = widget.sourcesList;
    _fetchNewsInBatches();
  }


  Future<void> _fetchNewsInBatches() async {
    List<List<Source>> batches = _splitListIntoBatches(_sourcesList, _maxConcurrentRequests);

    for (var batch in batches) {
      await Future.wait(batch.map((source) async {
        await _fetchNewsForSourceWithRetry(source);
      }));

      await Future.delayed(Duration(seconds: 2));
    }
  }


  List<List<Source>> _splitListIntoBatches(List<Source> sources, int batchSize) {
    List<List<Source>> batches = [];
    for (int i = 0; i < sources.length; i += batchSize) {
      batches.add(sources.sublist(i, i + batchSize > sources.length ? sources.length : i + batchSize));
    }
    return batches;
  }


  Future<void> _fetchNewsForSourceWithRetry(Source source, {int retries = 3, int delayInSeconds = 2}) async {
    try {
      final news = ApiManager.getNews(source.id ?? "");
      setState(() {
        _newsFutures[source.id ?? ""] = news;
      });
    } catch (e) {
      if (retries > 0) {
        print("Rate limit exceeded for ${source.name}. Retrying in $delayInSeconds seconds...");
        await Future.delayed(Duration(seconds: delayInSeconds));
        await _fetchNewsForSourceWithRetry(source, retries: retries - 1, delayInSeconds: delayInSeconds * 2);
      } else {
        print("Failed to fetch news for ${source.name} after multiple retries: $e");
      }
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          tabAlignment: TabAlignment.start,
          controller: _tabController,
          isScrollable: true,
          indicatorColor: Theme.of(context).indicatorColor,
          tabs: widget.sourcesList.map((source) {
            return Tab(
              child: Row(
                children: [
                  Text(source.name ?? "", style: Theme.of(context).textTheme.labelLarge),
                ],
              ),
            );
          }).toList(),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: widget.sourcesList.map((source) {
              return FutureBuilder<Map<String, dynamic>>(
                future: _newsFutures[source.id ?? ""],
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError || snapshot.data == null) {
                    return Center(child: Text("Failed to load news"));
                  } else {
                    var newsResponse = NewsResponse.fromJson(snapshot.data!);
                    var newsList = newsResponse.articles ?? [];

                    return Column(
                      children: [
                        Expanded(child: NewsItem(newsList: newsList, isSelected: true)),
                      ],
                    );
                  }
                },
              );
            }).toList(),
          ),
        ),
      ],
    );
  }
}
