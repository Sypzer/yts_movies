library movie;
import 'dart:core';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:yts_movies/src/models/serializers.dart';

part 'movie.g.dart';


abstract class Movie implements Built<Movie, MovieBuilder>{
  factory Movie([void Function(MovieBuilder b) updates ]) = _$Movie;
  factory Movie.fromJson(dynamic json) => serializers.deserializeWith(serializer, json);


  Movie._();

  String get title;

  BuiltList<String> get genres;

  String get summary;

  @BuiltValueField(wireName: 'large_cover_image')
  String get largeCoverImage;

  double get rating;

  Map<String, dynamic> get json =>serializers.serializeWith(serializer, this) as Map<String, dynamic>;

  static Serializer<Movie> get serializer => _$movieSerializer;
}