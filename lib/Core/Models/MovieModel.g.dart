// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieModel _$MovieModelFromJson(Map<String, dynamic> json) {
  return MovieModel(
    json['Title'],
    json['Year'],
    json['imdbID'],
    json['Type'],
    json['Poster'],
  );
}

Map<String, dynamic> _$MovieModelToJson(MovieModel instance) =>
    <String, dynamic>{
      'Title': instance.Title,
      'Year': instance.Year,
      'imdbID': instance.imdbID,
      'Type': instance.Type,
      'Poster': instance.Poster,
    };
