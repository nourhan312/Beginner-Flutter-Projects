import 'package:flutter/material.dart';
import 'package:news_app/core/routes/page_route_names.dart';
import 'package:news_app/core/utilis/app_colors.dart';
import '../../l10n/appLocalization.dart';
import '../home/drawer/home_drawer.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});

  final List<Map<String, String>> categories = [
    {"title": "General", "image": "assets/images/general-category.png"},
    {"title": "Business", "image": "assets/images/Business categ.png"},
    {"title": "Sports", "image": "assets/images/Sport.png"},
    {"title": "Technology", "image": "assets/images/Technology.png"},
    {"title": "Health", "image": "assets/images/Health.png"},
    {"title": "Science", "image": "assets/images/Science.png"},
    {"title": "Entertainment", "image": "assets/images/Entertainement.png"},
  ];

  @override
  Widget build(BuildContext context) {
    final AppLocalizations? localizations = Localizations.of<AppLocalizations>(context, AppLocalizations);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          localizations?.translate('home') ?? "Home", // Use translation
          style: Theme.of(context).textTheme.labelMedium,
        ),
      ),
      drawer: Drawer(
        child: HomeDrawer(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              localizations?.translate('goodMorning') ?? "Good Morning\nHere is Some News For You", // Use translation
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];

                  bool isImageLeft = ["General", "Sports", "Health", "Entertainment"]
                      .contains(category['title']);

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.blackColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Stack(
                        children: [
                          Align(
                            alignment:
                            isImageLeft ? Alignment.centerLeft : Alignment.centerRight,
                            child: Padding(
                              padding: EdgeInsets.only(
                                left: isImageLeft ? 10 : 0,
                                right: isImageLeft ? 0 : 10,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.asset(
                                  category['image']!,
                                  height: 210,
                                  width: 150,
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 40,
                            left: isImageLeft ? null : 20,
                            right: isImageLeft ? 20 : null,
                            child: Text(
                              category['title']!,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: 30,
                            right: isImageLeft ? 20 : null,
                            left: isImageLeft ? null : 20,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, PagesRouteName.home);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.greyColor,
                                foregroundColor: Colors.white,
                                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 9),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  if (!isImageLeft)
                                    Image.asset(
                                      "assets/images/2nd arrow.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                  SizedBox(width: 12),
                                  Text(
                                    localizations?.translate('viewAll') ?? "View All", // Use translation
                                    style: Theme.of(context).textTheme.labelMedium,
                                  ),
                                  if (isImageLeft)
                                    SizedBox(width: 12),
                                  if (isImageLeft)
                                    Image.asset(
                                      "assets/images/1st arrow.png",
                                      height: 40,
                                      width: 40,
                                    ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
