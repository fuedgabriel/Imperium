import 'package:flutter/material.dart';
import '../widgets/Comments.dart';

class Doubt extends StatefulWidget {
  @override
  _DoubtState createState() => _DoubtState();
}

class _DoubtState extends State<Doubt> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(0), bottom: Radius.circular(40)),
        ),
        title: Padding(padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.15), child: Center(child: Text('Biologia',) ),),
      ),
      backgroundColor: Colors.green,
      body: ListView(
        children: <Widget>[
          Container(
            height: 160,
            width: 160,
            child: Comments(Name: 'Fued', Matter: 'DNA', Title: 'Como é formado o desoxirribonucleico?',),
          )

        ],
      ),
    );
  }
}
