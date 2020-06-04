//widget
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../request/Json/Home/JsonLive.dart';

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
// ignore: must_be_immutable
class NewsCard extends StatelessWidget {
  final List<JsonLive> live;


  NewsCard({
    this.live
  });



  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.symmetric(horizontal: 0.0),
      scrollDirection: Axis.vertical,
      itemCount: live.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          height: 120,
          width: 100,
          child: Card(
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  child: Image.network(
                    live[index].image,
                    fit: BoxFit.fitWidth,
                    height: 160,
                    width: 160,
                  ),
                  onTap: (){
                    _launchURL(live[index].link);
                  },
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(live[index].title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), ),
                    Container(
                      width: MediaQuery.of(context).size.width*0.47,
                      child: Text('Tema: '+live[index].theme, style: TextStyle(fontSize: 16),),
                    ),
                    Text(live[index].time),
                  ],
                ),
                SizedBox(width: 2,),
              ],
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 5,
            margin: EdgeInsets.all(10),
          ),
        );
      },
    );
  }
}