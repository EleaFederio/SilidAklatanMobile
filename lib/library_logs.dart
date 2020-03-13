import 'package:flutter/material.dart';

class LibraryLogs extends StatefulWidget {
  @override
  _LibraryLogsState createState() => _LibraryLogsState();
}

class _LibraryLogsState extends State<LibraryLogs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Library Logs'),
      ),
    );
  }
}
