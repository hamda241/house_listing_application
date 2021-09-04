import 'package:flutter/material.dart';
import 'package:movie_application/Core/Proivder/MovieProvider.dart';
import 'package:movie_application/Screens/HomePage.dart';
import 'package:movie_application/Screens/MovieDetailIndex.dart';
import 'package:movie_application/Screens/MovieDetailScreen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'ErrorRoute.dart';

class Routing {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final title = settings.arguments;
    final year = settings.arguments;

    switch (settings.name) {
      case '/homepage':
        {
          return PageTransition(
              child: HomePage(), type: PageTransitionType.rightToLeft);
        }
      case '/moviedetail':
        {
          return PageTransition(
              child: MovieDetailIndex(
                title: title,
              ),
              type: PageTransitionType.rightToLeft);
        }
      default:
        return MaterialPageRoute(builder: (_) => ErrorRoute());
    }
  }
}
