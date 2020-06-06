import 'dart:convert';

import 'package:flutter/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:android/request/RequestMatter.dart';
import 'package:android/request/Json/Matter/JsonExercises.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:android/request/Json/Matter/JsonColector.dart';
// ignore: must_be_immutable
class Start extends StatefulWidget {
  @override
  String title;
  String id;
  Start(this.title, this.id);
  _StartState createState() => _StartState(id);
}
enum SingingCharacter { A, B, C, D, E }

class _StartState extends State<Start> {
  int indexExercices = 0;
  int indexExercicesBuilder = 0;
  Color BottomBarColor = Colors.white;
  String BottomBarText = "Enviar Resposta";
  List<JsonExercises> Exercises;
  String TitlePage = 'Carregando...';
  String Title = 'Carregando...';
  String A = 'Carregando...';
  String B = 'Carregando...';
  String C = 'Carregando...';
  String D = 'Carregando...';
  String E = 'Carregando...';

  Color MaterialButtonColor = Colors.white;
  Color MaterialButtonColorText = Colors.black.withOpacity(0.5);
  String MaterialButtonText = 'Selecione uma resposta';

  double MaterialButtonElevation = 0;
  IconData MaterialButtonIcon;
  List<JsonColector> Colector;
  Color AnserwA = Colors.white;
  Color AnserwB = Colors.white;
  Color AnserwC = Colors.white;
  Color AnserwD = Colors.white;
  Color AnserwE = Colors.white;


  _StartState(id){
    APIMatter.ExercisesSearch(id).then((response) async{
      Iterable list = json.decode(response.body);
      setState(() {
        Exercises = list.map((model) => JsonExercises.fromJson(model)).toList();
        indexExercices = Exercises.length;
        indexExercicesBuilder = Exercises.length;
      });
      SharedPreferences prefs = await SharedPreferences.getInstance();

      APIMatter.SelectorSearch(prefs.getString('_id'), id).then((valor){
        Iterable decode = json.decode(valor.body);
        Colector = decode.map((model) => JsonColector.fromJson(model)).toList();
        setState(() {
          if(Colector.toString() == '[]'){
            indexExercices = 0;
          }
          else{
            if(Colector[0].percent == null){
              indexExercices = 0;
            }
            else{
              indexExercices = Colector[0].percent;
            }
          }
          _ChangeText(indexExercices);
        });
      });
    });
  }
  _UpdateColector(index) async{
    if(index >= Colector[0].percent){
      APIMatter.SelectorUpdate(Colector[0].sId, index);
    }
  }


  SingingCharacter _character;

  _ChangeText(index){
    try {
      setState(() {
        _character = null;
        Title = Exercises[index].title;
        A = Exercises[index].answers[0].s1;
        B = Exercises[index].answers[0].s2;
        C = Exercises[index].answers[0].s3;
        D = Exercises[index].answers[0].s4;
        E = Exercises[index].answers[0].s5;
        AnserwA = Colors.white;
        AnserwB = Colors.white;
        AnserwC = Colors.white;
        AnserwD = Colors.white;
        AnserwE = Colors.white;
      });
    } on Exception catch (_) {
      print('_');

    }


  }

  Widget AnswersWidget(Title,SingingCharacter Op, Anserw) {
    if(Title == "" || Title ==null){
      return Container();
    }
    else{
      return ListTile(
        contentPadding: EdgeInsets.all(0),
        title: Text(Title, style: TextStyle(
            color: Anserw
        ),),
        leading: Radio(
          value: Op,
          groupValue: _character,
          onChanged: (SingingCharacter value) {
            setState(() {
              _character = value;
//              BottomBarColor = Colors.green[400];
              MaterialButtonColor = Colors.yellow;
              MaterialButtonColorText = Colors.deepPurple;
              MaterialButtonText = 'Enviar resposta  ';
              MaterialButtonElevation = 1;
              MaterialButtonIcon = Icons.send;
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: BottomAppBar(
        color: BottomBarColor,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black.withOpacity(0.5),
              onPressed: (){
                indexExercices = indexExercices-1;
                _ChangeText(indexExercices);
              },
            ),
            MaterialButton(
              elevation:  MaterialButtonElevation,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)
              ),
              color: MaterialButtonColor,
              disabledElevation: MaterialButtonElevation,
              focusElevation: MaterialButtonElevation,
              highlightElevation: MaterialButtonElevation,
              hoverElevation: MaterialButtonElevation,
              child: Row(
                children: <Widget>[
                  Text( MaterialButtonText, style: TextStyle(color:  MaterialButtonColorText),),
                  Icon(MaterialButtonIcon, color: MaterialButtonColorText,)
                ],
              ),
              onPressed: () {
                print(Exercises[indexExercices].correct);
                print(_character.index);
                if(Exercises[indexExercices].correct-1 == _character.index){
                  showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionBuilder: (context, a1, a2, widget) {
                        return Transform.scale(
                          scale: a1.value,
                          child: Opacity(
                            opacity: a1.value,
                            child: AlertDialog(
                              shape: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16.0)),
                              title: Text('Parabéns, você acertou a questão.',
                                style: TextStyle(
                                  fontSize: 15.6,
                                  color: Colors.green
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                      transitionDuration: Duration(milliseconds: 500),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (context, animation1, animation2) {var a; return a; });
                  Future.delayed(Duration(milliseconds: 2000), () {
                    Navigator.pop(context);
                  });
                  indexExercices = indexExercices+1;
                  _ChangeText(indexExercices);
                  _UpdateColector(indexExercices);
                }else{
                  showGeneralDialog(
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionBuilder: (context, a1, a2, widget) {
                        return AlertDialog(
                          title: Center(child: Text('Poxa, não foi dessa vez.', style: TextStyle(color: Colors.black.withOpacity(0.5), fontSize: 16), )),
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children : <Widget>[
                              Expanded(
                                child: Text(
                                  'Deseja tentar novamente?',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.green,

                                  ),
                                ),
                              )
                            ],
                          ),
                          actions: <Widget>[
                            FlatButton(
                              child: Text('Sim',),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              color: Colors.green,
                            ),
                            FlatButton(
                              child: Text('Não'),
                              onPressed: () {
                                setState(() {
                                  if(Exercises[indexExercices].correct == 1){
                                    AnserwA = Colors.yellow;
                                  }else if(Exercises[indexExercices].correct == 2){
                                    AnserwB = Colors.yellow;
                                  }
                                  else if(Exercises[indexExercices].correct == 3){
                                    AnserwC = Colors.yellow;
                                  }else if(Exercises[indexExercices].correct == 4){
                                    AnserwD = Colors.yellow;
                                  }else if(Exercises[indexExercices].correct == 5){
                                    AnserwE = Colors.yellow;
                                  }

                                });
                                Navigator.of(context).pop();
                              },
                              color: Colors.red,
                            )
                          ],
                        );
                      },
                      transitionDuration: Duration(milliseconds: 500),
                      barrierDismissible: true,
                      barrierLabel: '',
                      context: context,
                      pageBuilder: (context, animation1, animation2) {var a; return a; });
                }


              }
            ),


            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              color: Colors.black.withOpacity(0.5),
              onPressed: (){
                indexExercices = indexExercices+1;
                _ChangeText(indexExercices);
                _UpdateColector(indexExercices);

              },
            )
          ],
        ),
      ),
      appBar: AppBar(
          backgroundColor: HexColor('#480064'),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),),
          title: Center(child: Text(widget.title,))
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white
              ),
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: indexExercicesBuilder,
                itemBuilder: (BuildContext context, int index) {

                  return GestureDetector(
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                            width: 1,
                            color: Colors.amber[800]
                        ),
                      ),
                      child:  Center(
                          child: Text(
                            index.toString(),
                            style: TextStyle(
                              fontFamily: 'Georgia',
                              color: Colors.brown,
                              fontSize: 28,
                            ),
                          )
                      ),
                    ),
                    onTap: (){
                      _ChangeText(index);
                    },
                  );
                },
              )
          ),
          SizedBox(height: 10,),
          Text(Title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          Divider(),
          AnswersWidget(A, SingingCharacter.A, AnserwA),
          Divider(),
          AnswersWidget(B, SingingCharacter.B, AnserwB),
          Divider(),
          AnswersWidget(C, SingingCharacter.C, AnserwC),
          Divider(),
          AnswersWidget(D, SingingCharacter.D, AnserwD),
          Divider(),
          AnswersWidget(E, SingingCharacter.E, AnserwE),


          Container(
            margin: const EdgeInsets.only(left: 120, right: 120, top: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(60),
              border: Border.all(
                  width: 1,
                  color: Colors.amber[800]
              ),
            ),
            child:  Center(
                child: Text(
                  indexExercices.toString(),
                  style: TextStyle(
                    fontFamily: 'Georgia',
                    color: Colors.brown,
                    fontSize: 28,
                  ),
                )
            ),
          ),

//          Container(
//            height: 70,
//            child: Padding(
//                padding: EdgeInsets.only(top:10, left: 175, right: 175, bottom: 20),
//                child: Card(
//                    semanticContainer: true,
//                    elevation: 10,
//                    shape: RoundedRectangleBorder(
//                        borderRadius: BorderRadius.circular(10)
//                    ),
//                    child: GestureDetector(
//                      child: Stack(
//                        alignment: Alignment.center,
//                        children: <Widget>[
//                        ],
//                      ),
//                      onTap: (){
//                        return showDialog(
//                            context: context,
//                            builder: (BuildContext context) {
//                              return Card(
//                                margin: EdgeInsets.all(50),
//                                child: GridView.builder(
//                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 0,),
//                                    itemCount: 50,
//                                    itemBuilder: (context, index) {
//                                      return GestureDetector(
//                                        onTap: (){
//                                          setState(() {
//                                          });
//                                          Navigator.pop(context);
//                                        },
//                                        child: Card(
//                                          shape: RoundedRectangleBorder(
//                                            borderRadius: BorderRadius.circular(10.0),
//                                          ),
//                                          elevation: 50,
//                                          color: Colors.brown[800],
//                                          child: Stack(
//                                            alignment: Alignment.center,
//                                            children: <Widget>[
//
//                                            ],
//                                          ),
//                                        ),
//                                      );
//                                    }
//                                ),
//                              );
//                            });
//                      },
//                    )
//                )
//            ),
//          ),
        ],
      ),
    );
  }
}
