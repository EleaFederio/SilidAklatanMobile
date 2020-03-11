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
    var data = await http.get("http://10.0.2.2:8000/api/books");
    var jsonData = json.decode(data.body);
    List<Books> countries = [];

    for(var u in jsonData){
      Books country = Books(u["id"], u["title"], u["author"], u["publisher"], u["edition"], u["pages"], u["call_number"], u["year"], u["image_url"]);
      countries.add(country);
    }
    print(countries);
    return countries;
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
                      
//                      leading: Image(image: NetworkImage(snapshot.data[index].bookPic != null ? "http://10.0.2.2:8000/images/" + snapshot.data[index].bookPic : "http://10.0.2.2:8000/images/nobookcover.jpg"),),
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
  final String edition;
  final String pages;
  final String callNumber;
  final String year;
  final String bookPic;

  Books(this.id, this.title, this.author, this.publisher, this.edition, this.pages, this.callNumber, this.year, this.bookPic);
}
