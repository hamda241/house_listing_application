import 'package:json_annotation/json_annotation.dart';
import 'package:movie_application/Core/Models/MovieModel.dart';
part 'MovieListModel.g.dart';

@JsonSerializable()
class MovieListModel {
  List<MovieModel> Search;

  MovieListModel(this.Search);
  factory MovieListModel.fromJson(Map<String, dynamic> json) =>
      _$MovieListModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieListModelToJson(this);
}
