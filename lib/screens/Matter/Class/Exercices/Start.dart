import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class Start extends StatefulWidget {
  @override
  String title;
  Start(this.title);
  _StartState createState() => _StartState();
}
enum SingingCharacter { A, B, C, D, E }

class _StartState extends State<Start> {
  int _currentIndex = 0;

  SingingCharacter _character = SingingCharacter.A;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      bottomNavigationBar: BottomAppBar(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.arrow_back_ios),
              color: Colors.black.withOpacity(0.5),
              onPressed: (){

              },
            ),
            Text('Selecione uma resposta', style: TextStyle(color: Colors.black.withOpacity(0.7)),),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios),
              color: Colors.black.withOpacity(0.5),
              onPressed: (){
                
              },
            )
          ],
        ),
      ),
      appBar: AppBar(
          actions: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: GestureDetector(
                  onTap: () {

                  },
                  child: Icon(
                    Icons.list,
                    size: 30,
                  ),
                )
            ),],
          backgroundColor: Colors.indigoAccent,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),),
          title: Center(child: Text(widget.title,))
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: <Widget>[
          Container(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 16,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(4.0),
                    width: 50,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1, //                   <--- border width here
                      ),
                    ),
                    child:  Center(
                        child: Text(
                          index.toString(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                          ),
                        )
                    ),
                  );
                },
              )
          ),
          SizedBox(height: 10,),
          Text('A Revolução Industrial, no século XVIII, expressão do poder da burguesia em expansão, demonstrou a eficácia do novo saber inaugurado pela ciência moderna. A ciência e a técnica tornam-se aliadas, provocando modificações jamais vistas no ambiente humano. A exaltação desse novo saber e novo poder leva à concepção denominada de cientificismo. Das alternativas abaixo sobre a perspectiva cientificista, marque a INCORRETA.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          ),
          Divider(),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text('A ciência é considerada o único conhecimento possível.', style: TextStyle(
                color: Colors.white
            ),),
            leading: Radio(
              value: SingingCharacter.A,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() { _character = value; });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text('O método das ciências da natureza é o único que possui validade.', style: TextStyle(color: Colors.white),),
            leading: Radio(
              value: SingingCharacter.B,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text('O método das ciências da natureza deve estender-se a todos os campos da atividade humana.', style: TextStyle(color: Colors.white),),
            leading: Radio(
              value: SingingCharacter.C,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text('O método das ciências da natureza é falho e não oferece segurança para a investigação humana.', style: TextStyle(color: Colors.white),),
            leading: Radio(
              value: SingingCharacter.D,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          ListTile(
            contentPadding: EdgeInsets.all(0),
            title: const Text('O método das ciências da natureza não é falho e oferece segurança para a investigação humana.', style: TextStyle(color: Colors.white),),
            leading: Radio(
              value: SingingCharacter.E,
              groupValue: _character,
              onChanged: (SingingCharacter value) {
                setState(() {
                  _character = value;
                });
              },
            ),
          ),
          Container(
            height: 70,
            child: Padding(
                padding: EdgeInsets.only(top:10, left: 175, right: 175, bottom: 20),
                child: Card(
                    semanticContainer: true,
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: GestureDetector(
                      child: Stack(
                        alignment: Alignment.center,
                        children: <Widget>[
                          Text(
                            '0',
                            style: TextStyle(
                              letterSpacing: 2,
                              fontSize: 25,
                            )
                          ),
                        ],
                      ),
                      onTap: (){
                        return showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return Card(
                                margin: EdgeInsets.all(50),
                                child: GridView.builder(
                                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5, crossAxisSpacing: 0,),
                                    itemCount: 50,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                        onTap: (){
                                          setState(() {
                                          });
                                          Navigator.pop(context);
                                        },
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(10.0),
                                          ),
                                          elevation: 50,
                                          color: Colors.brown[800],
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: <Widget>[
                                              Text(
                                                index.toString(),
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.grey[300],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    }
                                ),
                              );
                            });
                      },
                    )
                )
            ),
          ),
        ],
      ),
    );
  }
}
