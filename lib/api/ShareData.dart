import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ShareData{

  getStudentData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    var studentJson = sharedPreferences.getString('student');
    var student = json.decode(studentJson);
    print(student);
    return student;
  }

}








Future<dynamic> getStudentInfo() async {
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var studentJson = sharedPreferences.getString('student');
  var student = json.decode(studentJson);
  return student;
}