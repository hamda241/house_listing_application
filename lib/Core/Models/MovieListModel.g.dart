// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MovieListModel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovieListModel _$MovieListModelFromJson(Map<String, dynamic> json) {
  return MovieListModel(
    (json['Search'] as List<dynamic>)
        .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$MovieListModelToJson(MovieListModel instance) =>
    <String, dynamic>{
      'Search': instance.Search,
    };
