import 'package:http/http.dart' as http;

const String ip = 'http://200.222.156.85:7844/api';
class API{

  // ignore: non_constant_identifier_names
  static Future HomePage() async{
    String url = '/lives/all';
    return await http.get(ip+url);
  }
  // ignore: non_constant_identifier_names
  static Future Live() async{
    return await http.get(ip+'/lives/all');
  }
  // ignore: non_constant_identifier_names
  static Future Matter(id) async{
    return await http.get(ip+'/Course/search/'+id.toString());
  }


}