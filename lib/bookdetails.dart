import 'package:flutter/material.dart';
import 'package:silid_aklatan_mobile/HomePage.dart';

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
                  image: NetworkImage(book.bookPic != '' ? "http://10.0.2.2/ComLab_Library_Server/alpha/books/" + book.bookPic : "http://10.0.2.2/ComLab_Library_Server/alpha/books/bookpics/no_image_book.jpg"),
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
                  book.callNumber,
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
                  book.pages,
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
                  book.year,
                  style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 20.0,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(width: 70.0,),
          Center(
            child: FlatButton(
              color: Colors.blueAccent,
              onPressed: (){
                print(book.id);
              },
              child: Text(
                'Borrow this Book' + book.id.toString(),
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
