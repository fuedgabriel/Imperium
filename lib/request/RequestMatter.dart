import 'package:http/http.dart' as http;
const String ip = 'http://200.222.156.85:7844/api';

class APIMatter {
  static Future MatterSearch(id) async{
    return await http.get(ip+'/Matter/search/matter/'+id.toString());
  }
  static Future ClassSearch(id) async{
    return await http.get(ip+'/Class/search/matter/'+id.toString());
  }
  static Future QuestionSearch(id) async{
    return await http.get(ip+'/Question/search/matter/'+id.toString());
  }

}