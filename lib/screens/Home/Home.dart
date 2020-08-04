import 'dart:convert';

import 'package:Imperium/request/RequestHome.dart';
import 'package:flutter/material.dart';
import 'widgets/card.dart';
import 'package:Imperium/request/Json/Home/JsonEpisteme.dart';
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}

class _Home extends State<Home> {

  // ignore: non_constant_identifier_names
  List ImageZero = [];
  // ignore: non_constant_identifier_names
  List TitleZero = [];
  // ignore: non_constant_identifier_names
  List LinkZero = [];
  // ignore: non_constant_identifier_names
  List ImageOne = [];
  // ignore: non_constant_identifier_names
  List TitleOne = [];
  // ignore: non_constant_identifier_names
  List LinkOne = [];
  // ignore: non_constant_identifier_names
  List ImageTwo = [];
  // ignore: non_constant_identifier_names
  List TitleTwo = [];
  // ignore: non_constant_identifier_names
  List LinkTwo = [];


  _Home(){
    API.Episteme(0).then((response){
      setState(() {
        Iterable listZero = json.decode(response.body);
        // ignore: non_constant_identifier_names
        List<JsonEpisteme> EspitemeZero = listZero.map((model) => JsonEpisteme.fromJson(model)).toList();
        ImageZero.addAll(EspitemeZero.map((f) => f.image).toList());
        TitleZero.addAll(EspitemeZero.map((f) => f.title).toList());
        LinkZero.addAll(EspitemeZero.map((f) => f.link).toList());
      });
    });
    API.Episteme(1).then((response){
      setState(() {
        Iterable listZero = json.decode(response.body);
        // ignore: non_constant_identifier_names
        List<JsonEpisteme> EspitemeOne = listZero.map((model) => JsonEpisteme.fromJson(model)).toList();
        ImageOne.addAll(EspitemeOne.map((f) => f.image).toList());
        TitleOne.addAll(EspitemeOne.map((f) => f.title).toList());
        LinkOne.addAll(EspitemeOne.map((f) => f.link).toList());
      });
    });
    API.Episteme(2).then((response){
      setState(() {
        Iterable listZero = json.decode(response.body);
        // ignore: non_constant_identifier_names
        List<JsonEpisteme> EspitemeTwo = listZero.map((model) => JsonEpisteme.fromJson(model)).toList();
        ImageTwo.addAll(EspitemeTwo.map((f) => f.image).toList());
        TitleTwo.addAll(EspitemeTwo.map((f) => f.title).toList());
        LinkTwo.addAll(EspitemeTwo.map((f) => f.link).toList());
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView(
        padding: EdgeInsets.only(top: 30),
        children: <Widget>[
          ContentScrollNews(typpe: 'Notícias', newsTitle: TitleZero, images: ImageZero, link: LinkZero,),
          ContentScrollNews(typpe: 'Repertório', newsTitle: TitleOne, images: ImageOne, link: LinkOne,),
          ContentScrollNews(typpe: 'Política', newsTitle: TitleTwo, images: ImageTwo, link: LinkTwo,),
        ]
      )
    );
  }
}
