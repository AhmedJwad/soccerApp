import 'dart:convert';
import 'package:soccerflutter/model/response.dart';
import 'package:http/http.dart'as http;
import 'package:soccerflutter/model/touranment.dart';
import 'constans.dart';

class Apihelper {
  static Future<Response> getTouranment() async {     

      var url = Uri.parse('${constans.apiUrl}/api/Tournaments');
      var response = await http.get(
        url,
        headers: {
          'content-type' : 'application/json',
          'accept' : 'application/json',         
        },
      );

      var body=response.body;
        if(response.statusCode >= 400)
        {
          return Response(isSuccess: false, result:body);
        }
        List<Tournament> list=[] ;  
        var decodedjson=jsonDecode(body);
        if(decodedjson != null)
        {
          for (var item in decodedjson) {
            list.add(Tournament.fromJson(item));
          }
        }
          return Response(isSuccess: true, result: list);
  }

}