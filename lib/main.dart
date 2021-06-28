import 'package:flutter/material.dart';
import 'package:yts_movies/src/my_app.dart';

void main() {
  runApp(const Home());
}
class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: const MyApp(),
    );
  }
}
