import 'package:http/http.dart' as http;
import 'dart:convert';


class APILOGIN{
  // ignore: non_constant_identifier_names
  static Future postLogin (email, password) async {
    try{
      Map data = {
        'Email': '$email',
        'Password': '$password'
      };
      var body = json.encode(data);
      return await http.post('http://200.222.156.85:7844/api/User/id', headers: {"Content-Type": "application/json"}, body: body);
    }
    catch (error) {
      return false;
    }
  }

}