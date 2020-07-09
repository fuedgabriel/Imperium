import 'dart:convert';

import 'package:Imperium/request/Json/Proof/YearList.dart';
import 'package:Imperium/request/RequestProof.dart';
import 'package:Imperium/screens/Widget/hex_color.dart';
import 'package:flutter/material.dart';
import 'widgets/YearCard.dart';
class ListYear extends StatefulWidget {
  String id;
  ListYear(this.id);
  @override
  _ListYearState createState() => _ListYearState(id);
}

class _ListYearState extends State<ListYear> {
  var YearList = List<JsonYearList>();

  Future getProofs(id) async{
    print(id);
    APIProof.YearList(id).then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        YearList = list.map((model) => JsonYearList.fromJson(model)).toList();
      });
    });
  }
  _ListYearState(id){
    getProofs(id);
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: HexColor('#480064'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),
        ),
        title: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15), child: Center(child: Text('Anos',) ),
        ),),
      backgroundColor: Colors.deepPurple,
        body: YearCard(proofs: YearList,)
    );
  }
}
