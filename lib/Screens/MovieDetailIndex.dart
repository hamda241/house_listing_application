import 'package:flutter/material.dart';
import 'package:movie_application/Core/Proivder/MovieProvider.dart';
import 'package:movie_application/Screens/MovieDetailScreen.dart';
import 'package:provider/provider.dart';

class MovieDetailIndex extends StatefulWidget {
  final title;

  const MovieDetailIndex({Key? key, this.title}) : super(key: key);
  @override
  _MovieDetailIndexState createState() => _MovieDetailIndexState();
}

class _MovieDetailIndexState extends State<MovieDetailIndex> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => MovieProvider()),
    ], child: MovieDetailScreen(title: widget.title,));
  }
}
