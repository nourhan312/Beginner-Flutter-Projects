import 'package:flutter/material.dart';
import 'package:news_app/core/routes/page_route_names.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home/drawer/home_drawer.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "General",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, PagesRouteName.search);
              },
              icon: Icon(
                Icons.search,
                  color: Theme.of(context).iconTheme.color
              ))
        ],
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: CategoryDetails(),
    );
  }
}
