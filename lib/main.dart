import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silid_aklatan_mobile/AccountPage.dart';
import 'package:silid_aklatan_mobile/HomePage.dart';
import 'package:silid_aklatan_mobile/login.dart';

/*
  Color Pallete
  f4eeff
  dcd6f7
  a6b1e1
  424874
 */

void main() => runApp(new MaterialApp(
  debugShowCheckedModeBanner: false,
  home: MyApp(),
));




class MyApp extends StatefulWidget {

  

  @override
  _MyAppState createState() => _MyAppState();

  MyApp({Key key});
}

class _MyAppState extends State<MyApp> {

  _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var studentJson = localStorage.getString('student');
    var student = json.decode(studentJson);
    return student;
  }

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  var studentData;
  int _currentIndex = 0;


  final List<Widget> _children = [
    HomePage(),
    AccountPage()
  ];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return Scaffold(
      body: studentData != null ? _children[1] : _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[100],
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            
            title: Text('Books'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Account'),
          ),
        ],
      currentIndex: _currentIndex,
        onTap: (currentIndex){
          setState(() {
            _currentIndex = currentIndex;
          });
        },
      ),
    );
  }


}


