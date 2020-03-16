import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:silid_aklatan_mobile/api/api.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  TextEditingController firstname = TextEditingController();
  TextEditingController middlename = TextEditingController();
  TextEditingController lastname = TextEditingController();
  TextEditingController course = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController studentId = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        body: ListView( children: <
            Widget>[
          Container(
            child: Stack(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(15.0, 30.0, 0.0, 0.0),
                  child: Text(
                    'REGISTER',
                    style:
                    TextStyle(fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  TextField(
                    controller: firstname,
                    decoration: InputDecoration(
                        labelText: 'FIRST NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: middlename,
                    decoration: InputDecoration(
                        labelText: 'MIDDLE NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: lastname,
                    decoration: InputDecoration(
                        labelText: 'LAST NAME',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: course,
                    decoration: InputDecoration(
                        labelText: 'COURSE',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: year,
                    decoration: InputDecoration(
                        labelText: 'YEAR',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: studentId,
                    decoration: InputDecoration(
                        labelText: 'STUDENT ID',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: email,
                    decoration: InputDecoration(
                        labelText: 'EMAIL',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        // hintText: 'EMAIL',
                        // hintStyle: ,
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: password,
                    decoration: InputDecoration(
                        labelText: 'PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: confirmPassword,
                    decoration: InputDecoration(
                        labelText: 'CONFIRM PASSWORD ',
                        labelStyle: TextStyle(
                            fontFamily: 'Montserrat',
                            fontWeight: FontWeight.bold,
                            color: Colors.grey),
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.blue))),
                    obscureText: true,
                  ),
                  SizedBox(height: 50.0),
                  Container(
                      height: 40.0,
                      child: Material(
                        borderRadius: BorderRadius.circular(20.0),
                        shadowColor: Colors.lightBlueAccent,
                        color: Colors.blue,
                        elevation: 7.0,
                        child: GestureDetector(
                          child: FlatButton(
                            onPressed: _isLoading ? null : _handleLogin,
                            child: Text(
                              _isLoading ? 'CREATING ACCOUNT...':'REGISTER',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat'),
                            ),
                          ),
                        ),
                      )),
                  SizedBox(height: 20.0),
                  Container(
                    height: 40.0,
                    color: Colors.transparent,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.black,
                              style: BorderStyle.solid,
                              width: 1.0),
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0)),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child:

                        Center(
                          child: Text('Go Back',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'Montserrat')),
                        ),


                      ),
                    ),
                  ),
                ],
              )
            ),
          ]
        )
    );
  }

  void _handleLogin() async{
    print('vcvcvvcMMMMMMMMMMMMMMMMMMMMMM');
    setState(() {
      _isLoading = true;
    });

    var data = {
      'firstname' : firstname.text,
      'middlename' : middlename.text,
      'lastname' : lastname.text,
      'course' : course.text,
      'year' : year.text,
      'student_id' : studentId.text,
      'email' : email.text,
      'password' : password.text,
      'c_password' : confirmPassword.text,
    };

   var res = await CallApi().postData(data, 'register');
   var body = json.decode(res.body);
   print(body);


  }
}
