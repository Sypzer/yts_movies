import 'package:flutter/material.dart';

class MoviePage extends StatefulWidget {
  const MoviePage(
      {Key key, this.title, this.imageUrl, this.summary, this.rating})
      : super(key: key);
  final String title;
  final String imageUrl;
  final String summary;

  final String rating;

  @override
  _MoviePageState createState() => _MoviePageState();
}

class _MoviePageState extends State<MoviePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 1.33,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    image: NetworkImage(
                      widget.imageUrl,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white12,
                    borderRadius: BorderRadius.circular(16)),
                height: 64,
                child: Align(
                  child: Text(
                    'RATING:  ${widget.rating}/10',
                    style: const TextStyle(
                        fontSize: 24,
                        color: Colors.greenAccent,
                        letterSpacing: 1.6),
                  ),
                  alignment: Alignment.center,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Summary:',
                  style: TextStyle(
                      fontSize: 24, color: Colors.white70, letterSpacing: 1.2),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                '   ${widget.summary}',
                style: const TextStyle(fontSize: 16, letterSpacing: 1.4),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
