import 'dart:convert';

import 'package:flutter/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:Imperium/request/RequestMatter.dart';
import 'package:Imperium/request/Json/Matter/JsonClass.dart';

import 'package:url_launcher/url_launcher.dart';

class Class extends StatefulWidget {
  final String id;
  final String title;
  Class(this.id, this.title);
  @override
  _ClassState createState() => _ClassState();
}


class _ClassState extends State<Class> {
  List<JsonClass> videos;

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  buildContainer() {
    return Container(
        child: FutureBuilder(
            future: APIMatter.ClassSearch(widget.id).then((response){
              setState(() {
                Iterable list = json.decode(response.body);
                videos = list.map((model) => JsonClass.fromJson(model)).toList();
              });
              return videos;
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: videos.length,
                    padding: EdgeInsets.only(top: 20),
                    itemBuilder: (context, index){
                      return Card(

                        elevation: 5,
                        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 6.0),
                        child: Container(
                          decoration: BoxDecoration(color: Colors.white60),
                          child: ListTile(
                            contentPadding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                            leading: Container(
                              padding: EdgeInsets.only(right: 12.0),
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(width: 1.0, color: Colors.black26))),
                              child: Icon(Icons.videocam),
                            ),
                            title: Text(
                              videos[index].title,
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                            trailing: GestureDetector(
                              child: Icon(
                                  Icons.play_circle_outline,
                                  color: Colors.brown,
                                  size: 40.0
                              ),
                              onTap: (){
                                _launchURL(videos[index].link);
                              },
                            ),
                          ),
                        ),
                      );
                    }
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }


  @override
  Widget build(BuildContext context) {
//    print(widget.id);
    return Scaffold(

      appBar: AppBar(
        backgroundColor: HexColor('#480064'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),
        ),
        title: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15), child: Center(child: Text(widget.title,) ),),
      ),
      backgroundColor: Colors.deepPurple,
      body: buildContainer()
    );
  }
}
