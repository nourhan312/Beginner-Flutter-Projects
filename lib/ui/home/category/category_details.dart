import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/APIs/api_manager.dart';
import 'package:news_app/model/SourceResponse.dart';
import 'package:news_app/ui/home/category/source_tab_view.dart';

class CategoryDetails extends StatefulWidget {
  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  late Future<SourceResponse?> _sourcesFuture;

  @override
  void initState() {
    super.initState();
    // Call the API only once during widget initialization
    _sourcesFuture = ApiManager.getSources();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourceResponse?>(
      future: _sourcesFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }

        print("API Snapshot Data: ${snapshot.data}");

        if (snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data?.status?.trim().toLowerCase() != 'ok') {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(snapshot.data?.message ?? "An error occurred, Try Again"),
              ElevatedButton(
                onPressed: () {
                  // Re-trigger the API call by updating the future
                  setState(() {
                    _sourcesFuture = ApiManager.getSources();
                  });
                },
                child: Text('Try Again'),
              ),
            ],
          );
        }

        var sourcesList = snapshot.data?.sources ?? [];
        if (sourcesList.isEmpty) {
          return Center(child: Text("No sources available"));
        }

        return SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
