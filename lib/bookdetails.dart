import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:silid_aklatan_mobile/HomePage.dart';
import 'package:silid_aklatan_mobile/api/api.dart';

class BookDetails extends StatelessWidget {

  final Books book;
  BookDetails(this.book);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Details'),
      ),
      body: ListView(
        padding: EdgeInsets.all(20.0),
        children: <Widget>[
          Center(
              child: SizedBox(
                height: 500.0,
                child: Image(
                  image: NetworkImage(book.image_url != null ? "http://192.168.254.102:8000/images/" + book.image_url : "http://192.168.254.102:8000/images/nobookcover.jpg"),
                ),
              )
          ),
          SizedBox(height: 50.0,),
          Center(
            child: Text(
              book.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 30.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Author:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.author,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Publisher:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.publisher,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Call Number:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.call_number,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Pages:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.pages.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Edition:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.edition,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20.0,),
          Row(
            children: <Widget>[
              SizedBox(width: 20.0,),
              SizedBox(
                width: 70.0,
                child: Text(
                  'Year:',
                  style: TextStyle(
                    fontSize: 15.0,
                  ),
                ),
              ),
              SizedBox(width: 20.0,),
              Flexible(
                child: Text(
                  book.year.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 100.0,),
          Container(
            margin: EdgeInsets.only(top: 20.0),
            height: 40.0,
            child: Material(
              color: Colors.blue,
              child: GestureDetector(
                onTap: () async {
                  SharedPreferences localStorage = await SharedPreferences.getInstance();
                  var studentJson = localStorage.getString('student');
                  var student = json.decode(studentJson);
                  int studentId = student['id'];
                  int bookIdNumber = book.id;

                  var data = {
                    'studentid' : studentId,
                    'bookid' : bookIdNumber,
                  };

                  var res = await CallApi().postData(data, 'borrow_book');
                  print('Student ID = $studentId'+' '+'Book ID = $bookIdNumber');
                },
                child: Center(
                  child: Text(
                    'BORROW THIS BOOK',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Montserrat'),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> borrowThisBook(int bookId) async {

  }

}

