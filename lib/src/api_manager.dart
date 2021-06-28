import 'dart:convert';

import 'package:http/http.dart';
import 'package:yts_movies/src/models/movie.dart';

class ApiManagerYTS {
  int page = 0;

  Future<List<Movie>> getMovies() async {
    page++;

    final List<Movie> movies = <Movie>[];
    //api example https://yts.mx/api/v2/list_movies.json
    final Response dataResponse = await get(Uri.https(
      'yts.mx',
      'api/v2/list_movies.json',
      {
        'page': page.toString(),
      },
    ));
    Map<String, dynamic> map =
        jsonDecode(dataResponse.body) as Map<String, dynamic>;
    List<dynamic> moviesDynamic = map['data']['movies'] as List<dynamic>;

    moviesDynamic.forEach((dynamic movie) {
      movies.add(Movie.fromJson(movie));
    });
    print(movies);

    return movies;
  }
}
