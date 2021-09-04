import 'package:json_annotation/json_annotation.dart';
part 'MovieDetailModel.g.dart';

@JsonSerializable()
class MovieDetailModel {
  final Title;
  final Year;
  final Plot;
  final Rated;
  final Released;
  final Runtime;
  final Genre;
  final Director;
  final Language;
  final Country;
  final Awards;
  final Poster;
  final imdbRating;

  MovieDetailModel(
      this.Title,
      this.Year,
      this.Rated,
      this.Released,
      this.Runtime,
      this.Genre,
      this.Director,
      this.Language,
      this.Country,
      this.Awards,
      this.Poster,
      this.Plot,
      this.imdbRating);

  factory MovieDetailModel.fromJson(Map<String, dynamic> json) =>
      _$MovieDetailModelFromJson(json);

  Map<String, dynamic> toJson() => _$MovieDetailModelToJson(this);
}
