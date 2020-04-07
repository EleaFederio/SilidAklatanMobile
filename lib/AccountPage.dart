import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silid_aklatan_mobile/account_setting.dart';
import 'package:silid_aklatan_mobile/borrowed_books.dart';
import 'package:silid_aklatan_mobile/evaluate.dart';
import 'package:silid_aklatan_mobile/faq.dart';
import 'package:silid_aklatan_mobile/library_logs.dart';
import 'package:silid_aklatan_mobile/login.dart';
import 'package:silid_aklatan_mobile/notification.dart';
import 'package:silid_aklatan_mobile/register.dart';
import 'package:silid_aklatan_mobile/report.dart';
import 'package:silid_aklatan_mobile/suggest_book.dart';
import 'package:silid_aklatan_mobile/api/ShareData.dart';

class AccountPage extends StatefulWidget {

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {

  var studentData;
  int _currentIndex = 0;

  @override
  void initState() {
    _getUserInfo();
    super.initState();
  }

  _getUserInfo() async {
    SharedPreferences localStorage = await SharedPreferences.getInstance();
    var studentJson = localStorage.getString('student');
    var student = json.decode(studentJson);
    setState(() {
      studentData = student;
    });
  }

  @override
  void setState(fn) {
    print(" ++++++++======= ${getStudentInfo()}");
    super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile'),
      ),
      body: ListView(

        children: <Widget>[
          Container(
//            color: Colors.blueGrey,
            padding : EdgeInsets.only(left: 32, right: 32, top: 32, bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                    height: 100,
                    width: 100,
                    child: ClipOval(
                      child: Image.network('https://eleafederio.github.io/eleazar.jpeg', fit: BoxFit.cover,),
                    )
                ),

                SizedBox(width: 16,),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(studentData!= null ? "${studentData['firstname']} ${studentData['lastname']}" : "Anonymous", style: TextStyle(color: Colors.black, fontFamily: "Roboto",
                          fontSize: 36, fontWeight: FontWeight.w700
                      ),),
                      Text(studentData!= null ? "${studentData['course']} ${studentData['year']}" : "", style: TextStyle(color: Colors.black, fontFamily: "Roboto",
                          fontSize: 16, fontWeight: FontWeight.w400
                      ),),
                      Text(studentData!= null ? "${studentData['student_id']}" : "2019-GC-000000", style: TextStyle(color: Colors.blueGrey, fontFamily: "Roboto",
                          fontSize: 16, fontWeight: FontWeight.w700,
                      ),),
                    ],
                  ),
                ),
//                Icon(Icons.person, color: Colors.blue, size: 40,)
              ],
            ),
          ),

          Container(
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            color: Colors.blueGrey,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.recent_actors, color: Colors.white, size: 30,),
                        SizedBox(width: 4,),
                        Text("23 x", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                            fontFamily: "Roboto", fontSize: 24
                        ),)
                      ],
                    ),

                    Text("Enter Library", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                        fontFamily: "Roboto", fontSize: 15
                    ),)
                  ],
                ),

                Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(Icons.library_books, color: Colors.white, size: 30,),
                        SizedBox(width: 4,),
                        Text("4", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700,
                            fontFamily: "Roboto", fontSize: 24
                        ),)
                      ],
                    ),

                    Text("Borrowed Books", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w400,
                        fontFamily: "Roboto", fontSize: 15
                    ),)
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 30.0,),
          FlatButton(
            onPressed: () async {
              SharedPreferences sharedData = await SharedPreferences.getInstance();
              sharedData.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountSettings()));
            },
              padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
              child: Row(
                children: <Widget>[
                  ClipOval(
                    child: Container(
                        padding: EdgeInsets.all(5.0),
                        color: Colors.green,
                        child: Icon(Icons.person, color: Colors.white, size: 20.0,),
                    ),
                  ),
                  SizedBox(width: 30.0,),
                  Expanded(
                    child: Text(
                        'Account Setting',
                        style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20.0,
                        ),
                    ),
                  ),
                ],
              ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blueAccent,
                    child: Icon(Icons.notifications, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Notification',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LibraryLogs()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blueGrey,
                    child: Icon(Icons.list, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Library Logs',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BorrowedBooks()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.deepOrange,
                    child: Icon(Icons.book, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Borrowed Books',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => SuggestABook()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.blue,
                    child: Icon(Icons.lightbulb_outline, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Suggest a Book',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Evaluate()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.lightGreen,
                    child: Icon(Icons.comment, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Evaluate',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Faq()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.lightBlue,
                    child: Icon(Icons.help_outline, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'FAQ?',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ReportPage()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.deepOrange,
                    child: Icon(Icons.report, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Report',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 10.0,),
          FlatButton(
            onPressed: ()  async {
              SharedPreferences localStorage = await SharedPreferences.getInstance();
              localStorage.clear();
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            },
            padding : EdgeInsets.only(left: 70, right: 70, top: 10, bottom: 10),
            child: Row(
              children: <Widget>[
                ClipOval(
                  child: Container(
                    padding: EdgeInsets.all(5.0),
                    color: Colors.black,
                    child: Icon(Icons.lock, color: Colors.white, size: 20.0,),
                  ),
                ),
                SizedBox(width: 30.0,),
                Expanded(
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 20.0,
                    ),
                  ),
                ),
              ],
            ),
          ),




        ],
      ),
    );
  }
}
