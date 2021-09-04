import 'package:json_annotation/json_annotation.dart';
part 'MovieModel.g.dart';

@JsonSerializable()
class MovieModel {
  final Title;
  final Year;
  final imdbID;
  final Type;
  final Poster;

  MovieModel(this.Title, this.Year, this.imdbID, this.Type, this.Poster);
  factory MovieModel.fromJson(Map<String, dynamic> json) => _$MovieModelFromJson(json);
  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
  
}
