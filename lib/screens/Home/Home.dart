import 'package:flutter/material.dart';
import 'widgets/card.dart';
class Home extends StatefulWidget {
  @override
  _Home createState() => _Home();
}
const List<String> matter = ['Matemática', 'Filosofia', 'Biologia', 'Redação'];
const List<String> images = ['math.jpg', 'filosofia.jpg', 'biologia.png', 'redacao.png'];

const List<String> newsTitle = ['Inep divulga critérios para correção da redação do Enem; objetivo é ajudar estudantes a se prepararem para a prova', 'Inscritos no Enem 2020 passam de 5,5 milhões, diz ministro'];
const List<String> newsSub = ['Aulas estão suspensas em todo o Brasil. Apesar da divulgação do material, parte dos candidatos pode não ter acesso à ele: 66% dos brasileiros de 9 a 17 anos não acessam a internet em casa.', 'Nesta sexta-feira (22), o MEC anunciou a prorrogação das inscrições. Data da provas também foi adiada por causa da pandemia de coronavírus.',];
const List<String> imagesnews = ['https://s2.glbimg.com/Bl4ugEMykW7o1buhL3UygK6k6QM=/0x0:1086x652/984x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_59edd422c0c84a879bd37670ae4f538a/internal_photos/bs/2020/q/g/q4UBRnSuAS0dcwHJIrTQ/distancia.jpg', 'https://www.rgl.com.br/img/cf738ff79632e09399d3f5e54de4a639/0/1',];



class _Home extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: ListView(
        children: <Widget>[
          ContentScrollMatter(matter: matter,images: images,), ContentScrollNews(newsTitle: newsTitle, newsSub: newsSub, images: imagesnews,)],),
    );
  }
}
