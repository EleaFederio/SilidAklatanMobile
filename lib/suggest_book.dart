import 'package:flutter/material.dart';

class SuggestABook extends StatefulWidget {
  @override
  _SuggestABookState createState() => _SuggestABookState();
}

class _SuggestABookState extends State<SuggestABook> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggest a Book'),
      ),
    );
  }
}
