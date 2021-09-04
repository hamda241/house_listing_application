import 'package:flutter/material.dart';
import 'package:movie_application/Core/Proivder/MovieProvider.dart';
import 'package:movie_application/Screens/SplashScreen.dart';
import 'package:provider/provider.dart';

class MovieDetailScreen extends StatefulWidget {
  final title;
  final year;

  const MovieDetailScreen({Key? key, this.title, this.year}) : super(key: key);
  @override
  _MovieDetailScreenState createState() => _MovieDetailScreenState();
}

class _MovieDetailScreenState extends State<MovieDetailScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController yearController = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<MovieProvider>(context, listen: false)
        .getMovieDetails(widget.title);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<MovieProvider>(
        builder: (context, movieProvider, movieDetails) {
      if (movieProvider.movieState == MovieStates.Loading)
        return SplashScreen();
      else if (movieProvider.movieState == MovieStates.Success) {
        print("THE NUM:$num");
        if (movieProvider.movieDetailModel.Awards.toString().length == 0)
          return Text("No Matched Results");
        else
          return Scaffold(
              backgroundColor: Colors.black,
              extendBodyBehindAppBar: true,
              appBar: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0.0,
                title: Text(
                  "${widget.title}",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  //  mainAxisAlignment: ,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                              '${movieProvider.movieDetailModel.Poster.toString()}'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                              Colors.black,
                              Colors.black.withOpacity(0.8),
                              Colors.black.withOpacity(0.5),
                              Colors.transparent
                            ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter)),
                        child: Padding(
                          padding: EdgeInsets.only(left: 15, bottom: 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${movieProvider.movieDetailModel.Title}',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 32,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Text(
                                '${movieProvider.movieDetailModel.Year},${movieProvider.movieDetailModel.Genre},${movieProvider.movieDetailModel.Runtime}',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.7),
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Row(
                                children: [
                                  Text(
                                    '${movieProvider.movieDetailModel.imdbRating}',
                                    style: TextStyle(
                                        color: Colors.yellow,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(width: 5),
                                  ...List.generate(
                                      5,
                                      (index) => Icon(Icons.star,
                                          color: (index <
                                                  (int.tryParse(movieProvider
                                                              .movieDetailModel
                                                              .imdbRating
                                                              .toString()) ??
                                                          -1 / 2)
                                                      .floor())
                                              ? Colors.yellow
                                              : Colors.white))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text("Overview",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 10),
                      child: Text("${movieProvider.movieDetailModel.Plot}",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Text("Director",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, top: 5),
                      child: Text("${movieProvider.movieDetailModel.Director}",
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.7),
                              fontSize: 15,
                              fontWeight: FontWeight.bold)),
                    )
                  ],
                ),
              ));
      } else
        return Center(
          child: Text("${movieProvider.errorMsg}"),
        );
    });
  }
}
