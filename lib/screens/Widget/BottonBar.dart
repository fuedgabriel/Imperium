import 'package:flutter/material.dart';
//page
import '../Config/Config.dart';
import '../Matter/Matter.dart';
import '../Home/Home.dart';
import '../News/News.dart';

class BottonBar extends StatefulWidget {
  @override
  _BottonBar createState() => _BottonBar();
}

class _BottonBar extends State<BottonBar> {
  int _currentIndex = 2;
  PageController _c;
  @override
  void initState(){
    _c =  new PageController(
      initialPage: _currentIndex,
    );
    super.initState();
  }
  final tabs = [
    Matter(),
    News(),
    Home(),
    Config()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          elevation: 10,
          type: BottomNavigationBarType.shifting,
          currentIndex: _currentIndex,
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.amber[800],
          backgroundColor: Colors.grey,
          unselectedLabelStyle: TextStyle(
              color: Colors.grey
          ),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('Matérias'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chrome_reader_mode),
              title: Text('Notícias'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Início'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Configurações'),
            ),
          ],

          onTap: (index){
            setState(() {
              this._c.jumpToPage(index);
            });
          },
        ),
      body: PageView(
        controller: _c,
        onPageChanged: (newPage){
          setState((){
            this._currentIndex=newPage;
          });
        },
        children: <Widget>[
          Matter(),
          News(),
          Home(),
          Config()
        ],
      ),
    );
  }
}
