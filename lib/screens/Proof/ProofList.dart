import 'dart:convert';
import 'package:Imperium/request/Json/Proof/JsonProofList.dart';
import 'package:Imperium/screens/Proof/ListYear.dart';
import 'package:Imperium/screens/Widget/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:Imperium/request/RequestProof.dart';


class ProofList extends StatefulWidget {
  final String id;
  ProofList(this.id);
  @override
  _ProofListState createState() => _ProofListState();
}

class _ProofListState extends State<ProofList> {

  List<JsonProofList> search;


  buildContainer() {
    return Container(
        child: FutureBuilder(
            future: APIProof.ProofSearch(widget.id).then((response){
              setState(() {
                Iterable list = json.decode(response.body);
                search = list.map((model) => JsonProofList.fromJson(model)).toList();
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
                                color: Colors.amber[800],
                                elevation: 10,
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
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => ListYear(search[index].sId)));
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
      appBar: AppBar(
        backgroundColor: HexColor('#480064'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),
        ),
        title: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15), child: Center(child: Text('Provas',) ),
        ),),
      backgroundColor: Colors.deepPurple,
      body: buildContainer(),
    );
  }
}
