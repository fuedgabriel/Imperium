//widget
import 'package:Imperium/request/Json/Proof/JsonProof.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:Imperium/screens/Proof/ProofList.dart';
// ignore: must_be_immutable
class ProofsCard extends StatelessWidget {
  final List<JsonProof> proofs;


  ProofsCard({
    this.proofs
  });



  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.only(top: 30),
      scrollDirection: Axis.vertical,
      itemCount: proofs.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 120,
          width: 100,
          child: GestureDetector(
            child: Card(
              semanticContainer: true,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image(image: NetworkImage(proofs[index].image), fit: BoxFit.cover,),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 5,
              margin: EdgeInsets.all(10),
            ),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ProofList(proofs[index].sId)));
            },
          )
        );
      },
    );
  }
}