import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class RandomWords extends StatefulWidget {
  @override
  RandomWordState createState() => RandomWordState();
}

class RandomWordState extends State<RandomWords> {
  final _randomWords = <WordPair>[];
  final _savedWordsPairs = Set<WordPair>();

  Widget _buildList() {
    return ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (context, item) {
          if (item.isOdd) return Divider();
          final index = item ~/ 2;

          if (index >= _randomWords.length) {
            _randomWords.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_randomWords[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final _alreadySaved = _savedWordsPairs.contains(pair);
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: TextStyle(fontSize: 18.2),
      ),
      trailing: Icon(_alreadySaved ? Icons.favorite : Icons.favorite_border,
          color: _alreadySaved ? Colors.red : null),
      onTap: () {
        setState(() {
          if (_alreadySaved) {
            _savedWordsPairs.remove(pair);
          } else {
            _savedWordsPairs.add(pair);
          }
        });
      },
      // ,onTap: ,
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("wordpair generator"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.list), onPressed: _pushedSaved)
        ],
      ),
      body: _buildList(),
    );
  }
}
