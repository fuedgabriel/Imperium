import 'dart:convert';

import 'package:flutter/material.dart';
import 'widgets/news.dart';
import 'package:Imperium/request/RequestProof.dart';
import 'package:Imperium/request/Json/Proof/JsonProof.dart';

class Simulator extends StatefulWidget {
  @override
  _Simulator createState() => _Simulator();
}

class _Simulator extends State<Simulator> {
  var Proofs = List<JsonProof>();

  Future getProofs() async{
    APIProof.ProofAll().then((response){
      setState(() {
        Iterable list = json.decode(response.body);
        Proofs = list.map((model) => JsonProof.fromJson(model)).toList();
      });
    });
  }
  _Simulator(){
    getProofs();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.deepPurple,
        body: ProofsCard(proofs: Proofs,)
    );
  }
}
