import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/utilis/app_colors.dart';

import '../../../core/routes/page_route_names.dart';
import '../../../cubit/languageCubit.dart';
import '../../../cubit/themeCubit.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [

          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: 40),
            color: AppColors.whiteColor,
            child: Text(
              "News App",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),


          Expanded(
            child: Container(
              color: AppColors.blackColor,
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.home, color: AppColors.whiteColor),
                    title: Text(
                      "Go To Home",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, PagesRouteName.homeView);
                    },
                  ),

                  Divider(color: AppColors.whiteColor),
                  SizedBox(height: 15),


                  _buildDropdownContainer(
                    icon: Icons.brightness_6,
                    label: "Theme",
                    dropdownValue: "Dark",
                    items: ["Dark", "Light"],
                    onChanged: (value) {
                      context.read<ThemeCubit>().toggleTheme();
                    },
                  ),
                  SizedBox(height: 15),
                  Divider(color: AppColors.whiteColor),
                  SizedBox(height: 15),


                  _buildDropdownContainer(
                    icon: Icons.language,
                    label: "Language",
                    dropdownValue: "English",
                    items: ["English", "Arabic"],
                    onChanged: (value) {
                      context.read<LanguageCubit>().changeLanguage('ar');
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownContainer({
    required IconData icon,
    required String label,
    required String dropdownValue,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: AppColors.whiteColor, size: 20),
              SizedBox(width: 8),
              Text(
                label,
                style: TextStyle(color:AppColors.whiteColor, fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          SizedBox(height: 5),


          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: AppColors.whiteColor, width: 2),
            ),
            child: DropdownButtonFormField<String>(
              value: dropdownValue,
              dropdownColor: AppColors.blackColor,
              style: TextStyle(color: AppColors.whiteColor),
              decoration: InputDecoration(
                border: InputBorder.none,
              ),
              items: items.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(item, style: TextStyle(color: AppColors.whiteColor)),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ],
      ),
    );
  }
}
