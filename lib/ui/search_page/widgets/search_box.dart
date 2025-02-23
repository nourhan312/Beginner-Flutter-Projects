import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/core/utilis/app_colors.dart';

class SearchBox extends StatefulWidget {
  @override
  State<SearchBox> createState() => _SearchBoxState();
}

class _SearchBoxState extends State<SearchBox> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color:AppColors.blackColor),
      ),
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Icon(Icons.search, color: AppColors.blackColor),
          SizedBox(width: 12),
          Expanded(
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Search",
                hintStyle: TextStyle(color: AppColors.blackColor, fontSize: 20),
                border: InputBorder.none,
              ),
              style: TextStyle(color: AppColors.blackColor, fontSize: 16),
              onChanged: (value) {
                setState(() {});
              },
            ),
          ),
          if (_searchController.text.isNotEmpty)
            GestureDetector(
              onTap: () {
                setState(() {
                  _searchController.clear();
                });
              },
              child: Icon(Icons.close, color: AppColors.blackColor),
            ),
        ],
      ),
    );
  }
}
