import 'package:flutter/material.dart';
import './random_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final wordPair = WordPair.random();
    return MaterialApp(
        theme: ThemeData(primaryColor: Colors.deepOrangeAccent[400]),
        home: RandomWords());
  }
}
