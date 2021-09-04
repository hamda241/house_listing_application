import 'package:flutter/material.dart';
import 'package:movie_application/Config/config.dart';
import 'package:movie_application/Core/API/ApiRequest.dart';
import 'package:movie_application/Core/Models/MovieDetailModel.dart';
import 'package:movie_application/Core/Models/MovieListModel.dart';

enum MovieStates { Loading, Success, Failure }

class MovieProvider extends ChangeNotifier {
  late MovieDetailModel _movieDetails;
  MovieDetailModel get movieDetailModel => _movieDetails;

  late MovieListModel _moviesList;
  MovieListModel get moviesList => _moviesList;

  MovieStates _movieStates = MovieStates.Loading;
  MovieStates get movieState => _movieStates;

  String _errorMsg = "";
  String get errorMsg => _errorMsg;

  getMovieData(title, year) async {
    final endpoint;

    if (year.toString().isEmpty)
      endpoint = "?s=" + title + api_key;
    else if (title.toString().isEmpty)
      endpoint = "?s=" + year + api_key;
    else
      endpoint = "?s=" + title + "&y=" + year + api_key;

    final response = await getAPI(endpoint);
    print("The  response:$response");

    if (response["Response"] == "True") {
      print("TRUE");
      final json = {"Search": response["Search"]};
      print("JSON: $json");
      _moviesList = MovieListModel.fromJson(json);
      print("Movie list: $_moviesList");
      _movieStates = MovieStates.Success;
      notifyListeners();
    } else {
      _movieStates = MovieStates.Failure;
      _errorMsg = "Something went wrong";
      notifyListeners();
    }
  }

  getMovieDetails(title) async {
    final endpoint = "?t=" + title + api_key;

    final response = await getAPI(endpoint);
    print("The  response:$response");

    if (response["Response"] == "True") {
      print("TRUE");
      final json = {
        "Title": response["Title"],
        "Year": response["Year"],
        "Plot": response["Plot"],
        "Poster": response["Poster"],
        "Rated": response["Rated"],
        "Released": response["Released"],
        "Runtime": response["Runtime"],
        "Genre": response["Genre"],
        "Director": response["Director"],
        "Language": response["Language"],
        "Country": response["Country"],
        "Awards": response["Awards"],
        "imdbRating": response["imdbRating"],
      };
      print("JSON: $json");
      _movieDetails = MovieDetailModel.fromJson(json);
      print("Movie list: $_movieDetails");
      _movieStates = MovieStates.Success;
      notifyListeners();
    } else {
      _movieStates = MovieStates.Failure;
      _errorMsg = "Something went wrong";
      notifyListeners();
    }
  }
}
