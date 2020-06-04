import 'dart:convert';
import 'package:flutter/material.dart';
import 'widgets/news.dart';
import '../../request/RequestHome.dart';
import '../../request/Json/Home/JsonLive.dart';


class News extends StatefulWidget {
  @override
  _News createState() => _News();
}


class _News extends State<News> {
  var live = List<JsonLive>();

  _News(){
    API.Live().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        live = list.map((model) => JsonLive.fromJson(model)).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView(
        children: <Widget>[
          NewsCard(live: live,)
        ]
      )
    );
  }
}
