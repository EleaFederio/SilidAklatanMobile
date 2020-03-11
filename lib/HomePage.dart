import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:silid_aklatan_mobile/bookdetails.dart';


class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<Books>> _getBooks() async {
    print('to read url');
    var data = await http.get("http://192.168.43.115:5000/api/books");
    print('Nabasa na ang url');
    var jsonData = json.decode(data.body);
    print("++++++++++++++++++++ ${jsonData} ++++++++++++++++++++++");
    List<Books> books = [];



    for(var u in jsonData){


      print("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA ${u["title"]} AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
      Books book = Books(u["id"], u["title"], u["author"], u["publisher"], u["call_number"], u["isbn"], u["edition"], u["year"], u["pages"], u["copies"], u["remarks"], u["image_url"], u["created_at"], u["updated_at"]);
      print('Adding Books');
      books.add(book);
      print('Hahaha');
    }
    return books;

  }


  bool isSearching = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Color(0xffff7315),
        title: !isSearching ?
        Text("Book") :
        TextField(
          style: TextStyle(
            color: Colors.white,
          ),
          decoration: InputDecoration(
            fillColor: Colors.white,

            icon: Icon(Icons.book, color: Colors.white,),
            hintText: 'Search Book...',
            hintStyle: TextStyle(
              color: Colors.white,
            )
          ),
        ),
        actions: <Widget>[
          !isSearching ?
          IconButton(
            icon: Icon(Icons.search),
            onPressed: (){
              setState(() {
                this.isSearching = !this.isSearching;
              });
            },
          ):
          IconButton(
            icon: Icon(Icons.cancel),
            onPressed: (){
              setState(() {
                this.isSearching = !this.isSearching;
              });
            },
          )
        ],
      ),

      body: SafeArea(
        child: Container(
          child: FutureBuilder(
            future: _getBooks(),
            builder: (BuildContext context, AsyncSnapshot snapshot){
              if(snapshot.data == null){
                return Container(
                  child: Center(
                    child: Text("Loading..."),
                  ),
                );
              }else{
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index){
                    return ListTile(

                      onTap: (){
                        Navigator.push(
                          context,
                          new MaterialPageRoute(builder: (context) => BookDetails(snapshot.data[index])),
                        );
                      },
                      dense: true,
                      contentPadding: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 20.0, right: 20.0),

                      leading: Image(image: NetworkImage(snapshot.data[index].bookPic != null ? "http://192.168.43.115:5000/images/" + snapshot.data[index].bookPic : "http://192.168.43.115:5000/images/nobookcover.jpg"),),
                      // leading: Image(
                      //     image: AssetImage("assets/no_image_book.jpg"),
                      //     height: 300.0,
                      //   ),
                      title: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              snapshot.data[index].title,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Author: "+snapshot.data[index].author,
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      )
                    );
                  },
                );
              }
            },
          ),
        ),
      ),

    );
  }
}

class Books{
  final int id;
  final String title;
  final String author;
  final String publisher;
  final String call_number;
  final String isbn;
  final String edition;
  final String year;
  final String pages;
  final String copies;
  final String remarks;
  final String image_url;
  final String created_at;
  final String updated_at;

  Books(this.id, this.title, this.author, this.publisher, this.call_number, this.isbn, this.edition, this.year, this.pages, this.copies, this.remarks, this.image_url, this.created_at, this.updated_at);
}
