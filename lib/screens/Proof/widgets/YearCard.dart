//widget
import 'package:Imperium/request/Json/Proof/YearList.dart';
import 'package:Imperium/screens/Matter/Class/Exercices/Start.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
// ignore: must_be_immutable
class YearCard extends StatelessWidget {
  final List<JsonYearList> proofs;


  YearCard({
    this.proofs
  });


  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing:6, mainAxisSpacing: 0, childAspectRatio: 1.7),
      scrollDirection: Axis.vertical,
      itemCount: proofs.length,
      padding: EdgeInsets.all(10),
      itemBuilder: (context, index) {
        return Container(
          padding: EdgeInsets.only(top: 10, bottom: 5, right: 0),
          child: FlatButton(
            padding: EdgeInsets.all(0),
            color: Colors.white,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(proofs[index].title.toString()),
                SizedBox(width: 10,),
                Text('|'),
                IconButton(icon: Icon(Icons.language, size: 24, ), padding: EdgeInsets.only(left: 20), onPressed: (){
                  _launchURL(proofs[index].link);
                },)
              ],
            ),
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => Start(proofs[index].title.toString(), proofs[index].sId)));
            },
          ),
        );
      },
    );
  }
}