import 'dart:convert';

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
  static Future ExercisesSearch(id) async{
    return await http.get(ip+'/Exercises/search/question/'+id.toString());
  }
  static Future SelectorSearch(IDuser, IDquestion ) async{
    try{
      Map data = {
        'User': '$IDuser',
        'Question': '$IDquestion'
      };
      var body = json.encode(data);
      return await http.post(ip+'/Colector/search', headers: {"Content-Type": "application/json"}, body: body);
    }
    catch (error) {
      return false;
    }
  }
  static Future SelectorUpdate(IDquestion, Percent) async{
    try{
      Map data = {
        'Percent': Percent
      };
      var body = json.encode(data);
      return await http.put(ip+'/Colector/update/'+IDquestion.toString(), headers: {"Content-Type": "application/json"}, body: body);
    }
    catch (error) {
      return false;
    }
  }

}