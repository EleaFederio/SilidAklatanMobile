import 'package:flutter/material.dart';

class BorrowedBooks extends StatefulWidget {
  @override
  _BorrowedBooksState createState() => _BorrowedBooksState();
}

class _BorrowedBooksState extends State<BorrowedBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Borrowed Books'),
      ),
    );
  }
}
