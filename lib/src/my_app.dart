import 'package:flutter/material.dart';
import 'package:yts_movies/src/api_manager.dart';
import 'package:yts_movies/src/models/movie.dart';
import 'package:yts_movies/src/movie_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ApiManagerYTS apiManagerYTS = ApiManagerYTS();
  List<Movie> movies = <Movie>[];

  void addMovies() async {
    List<Movie> moviesToAdd = <Movie>[];
    moviesToAdd = await apiManagerYTS.getMovies();
    moviesToAdd.forEach((Movie movie) {
      movies.add(movie);
    });
    setState(() {});
  }

  @override
  void initState() {
    addMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('YTS Movies'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: movies.isEmpty
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : GridView.builder(
                    itemCount: movies.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.66,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                        child: GridTile(
                          child: Image.network(movies[index].largeCoverImage),
                          footer: GridTileBar(
                            backgroundColor: Colors.black38,
                            title: Text(movies[index].title),
                            subtitle: Text(movies[index].genres.join(', ')),
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute<void>(
                              builder: (BuildContext context) {
                            return MoviePage(
                              title: movies[index].title,
                              summary: movies[index].summary,
                              rating: movies[index].rating.toString(),
                              imageUrl: movies[index].largeCoverImage,
                            );
                          }));
                        },
                      );
                    }),
          ),
          TextButton(
            onPressed: addMovies,
            child: const Text('Load More'),
          ),
        ],
      ),
    );
  }
}
