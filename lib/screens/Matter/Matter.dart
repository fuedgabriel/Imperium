import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'widgets/MyCourses.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:Imperium/request/RequestHome.dart';
import 'package:Imperium/request/Json/Home/JsonMatter.dart';
//pages
class Matter extends StatefulWidget {
  @override
  _MatterState createState() => _MatterState();
}



class _MatterState extends State<Matter> {


  List<String> courses;
  var ado = List<JsonMatter>();
  JsonMatter list;
  _MatterState(){
    getCourses();
  }


  Future getCourses() async{
    final prefs = await SharedPreferences.getInstance();
    courses = prefs.getStringList('Courses');
    for(int i = 0; courses.length> i; i++){
      API.Matter(courses[i]).then((response){
        list = JsonMatter.fromJson(json.decode(response.body));
        setState(() {
          ado.add(list);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: MyCourses(matter: ado, percent: 0.03,)
    );
  }
}
