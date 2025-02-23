import 'package:flutter/material.dart';
import 'package:news_app/core/routes/page_route_names.dart';
import 'package:news_app/model/NewsResponse.dart';


class NewsItem extends StatelessWidget {
  final List<News> newsList;
  final bool isSelected;

  NewsItem({required this.newsList,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: newsList.length,
        padding: EdgeInsets.all(10),
        itemBuilder: (context, index) {
          var news = newsList[index];
          return GestureDetector(
              onTap: () => _showNewsDetails(context,news),
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      news.urlToImage ?? "",
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    news.title ?? "No title available",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "By: ${news.author ?? "Unknown"}",
                    style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                  ),
                  SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Spacer(),
                      Text(
                        news.publishedAt ?? "Unknown time",
                        style: TextStyle(fontSize: 12, color: Colors.grey[500]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
  void _showNewsDetails(BuildContext context, dynamic news) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.black,
      isScrollControlled: true,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // News Image
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  news.urlToImage ?? "https://via.placeholder.com/150",
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
              SizedBox(height: 10),


              Text(
                news.description ?? "No Description Available",
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
              SizedBox(height: 15),


              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    PagesRouteName.news,
                    arguments: news,
                  );

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 12),
                ),
                child: Center(
                  child: Text(
                    "View Full Article",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
  }
