import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:silid_aklatan_mobile/AccountPage.dart';
import 'package:silid_aklatan_mobile/HomePage.dart';

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
}

class _MyAppState extends State<MyApp> {
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
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.black,
        items: const<BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: Text('Profile'),
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


