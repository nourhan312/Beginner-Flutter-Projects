import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/ui/search_page/widgets/search_box.dart';

import '../home/category/category_details.dart';

class SearchPage extends StatefulWidget{

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: SearchBox(),
      ),
        body:CategoryDetails()
    );
  }
}
