// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieDetailModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieDetailModel _$MovieDetailModelFromJson(Map<String, dynamic> json) {
  return MovieDetailModel(
    json['Title'],
    json['Year'],
    json['Rated'],
    json['Released'],
    json['Runtime'],
    json['Genre'],
    json['Director'],
    json['Language'],
    json['Country'],
    json['Awards'],
    json['Poster'],
    json['Plot'],
    json['imdbRating'],
  );
}

Map<String, dynamic> _$MovieDetailModelToJson(MovieDetailModel instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'Plot': instance.Plot,
      'Rated': instance.Rated,
      'Released': instance.Released,
      'Runtime': instance.Runtime,
      'Genre': instance.Genre,
      'Director': instance.Director,
      'Language': instance.Language,
      'Country': instance.Country,
      'Awards': instance.Awards,
      'Poster': instance.Poster,
      'imdbRating': instance.imdbRating,
    };
