import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'Exercices/Start.dart';
import 'package:android/request/RequestMatter.dart';
import 'package:android/request/Json/Matter/JsonQuestion.dart';


class Exercices extends StatefulWidget {
  final String id;
  final String title;
  Exercices(this.id, this.title);
  @override
  _ExercicesState createState() => _ExercicesState();
}


const List<Key> keys = [
  Key("Network"),
  Key("NetworkDialog"),
  Key("Flare"),
  Key("FlareDialog"),
  Key("Asset"),
  Key("AssetDialog")
];
class _ExercicesState extends State<Exercices> {
  List<JsonQuestion> search;

  buildContainer() {
    return Container(
        child: FutureBuilder(
            future: APIMatter.QuestionSearch(widget.id).then((response){
              setState(() {
                Iterable list = json.decode(response.body);
                search = list.map((model) => JsonQuestion.fromJson(model)).toList();
              });
              return search;
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing:0,),
                    scrollDirection: Axis.vertical,
                    itemCount: search.length,
                    padding: EdgeInsets.only(left: 2, top: 10),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: MediaQuery.of(context).size.width * 0.33,
                              height: 130,

                              child: Card(
                                elevation: 4,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0)
                                ),
                                child: Container(
                                  height: 90,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    image: DecorationImage(
                                      image: AssetImage("assets/backgroud.png"),
                                      fit: BoxFit.cover,

                                    ),
                                  ),
                                  child: GestureDetector(
                                    child: ListView(
                                      physics: NeverScrollableScrollPhysics(),
                                      padding: EdgeInsets.only(top: 10),
                                      children: <Widget>[
                                        Image(
                                          image: NetworkImage(search[index].image),
                                          fit: BoxFit.scaleDown,
                                          height: 80,
                                        ),
                                        Padding(padding: EdgeInsets.only(top: 4),),
                                        Center(
                                          child: Text(
                                            search[index].title,
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    onTap: (){
                                      showDialog(
                                          context: context,
                                          builder: (_) => NetworkGiffyDialog(
                                            key: keys[1],
                                            image: ListView(
                                              padding: EdgeInsets.all(18),
                                              children: <Widget>[
                                                Padding(
                                                  padding: EdgeInsets.all(10),
                                                  child: Text(
                                                    'Seu Progresso',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 22.0, fontWeight: FontWeight.w600),
                                                  ),
                                                ),
                                                CircularPercentIndicator(
                                                  radius: 120.0,
                                                  lineWidth: 13.0,
                                                  animation: true,
                                                  percent: 0.7,
                                                  center: Text(
                                                    "70.0%",
                                                    style:
                                                    TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                                                  ),
                                                  circularStrokeCap: CircularStrokeCap.round,
                                                  progressColor: Colors.brown,
                                                ),
                                              ],
                                            ),
                                            entryAnimation: EntryAnimation.BOTTOM,
                                            title: Text(
                                                ''
                                            ),
                                            buttonOkText: Text(
                                              'Iniciar',
                                              style: TextStyle(
                                                  color: Colors.white
                                              ),
                                            ),
                                            onOkButtonPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => Start(search[index].title)));
                                            },
                                          ));
                                    },
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
        appBar: AppBar(
            backgroundColor: HexColor('#480064'),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),),
            title: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15), child: Center(child: Text(widget.title,)),)
        ),
      body: buildContainer()
    );
  }
}
