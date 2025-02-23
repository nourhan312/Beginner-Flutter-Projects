import 'package:flutter/material.dart';
import 'package:news_app/core/routes/page_route_names.dart';
import 'package:news_app/model/NewsResponse.dart';
import 'package:news_app/ui/home/category/category_details.dart';
import 'package:news_app/ui/home_view/homeview.dart';
import 'package:news_app/ui/news/newsDetailsScreen.dart';
import 'package:news_app/ui/search_page/search_page.dart';
import 'package:news_app/ui/splashScreen/splash_screen.dart';
import '../../ui/home/category/home_screen.dart';

abstract class AppRoutes{
  static Route onGeneratedRoute(RouteSettings settings){
    switch(settings.name){
      case PagesRouteName.initial:
        return MaterialPageRoute(builder:(context) => SplashScreen(),
            settings: settings
        );
      case PagesRouteName.category:
        return MaterialPageRoute(builder:(context) => CategoryDetails(),
            settings: settings
        );
      case PagesRouteName.home:
        return MaterialPageRoute(builder:(context) => HomeScreen(),
            settings: settings
        );
      case PagesRouteName.search:
        return MaterialPageRoute(builder:(context) => SearchPage(),
            settings: settings
        );
      case PagesRouteName.homeView:
        return MaterialPageRoute(builder:(context) => HomeView(),
            settings: settings
        );
      case PagesRouteName.news:
        final news = settings.arguments as News;
        return MaterialPageRoute(
          builder: (context) => NewsDetails(news: news),
          settings: settings,
        );




      default:
        return MaterialPageRoute(builder:(context) => SplashScreen(),
            settings: settings
        );

    }
  }
}

