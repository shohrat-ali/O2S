import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class ApiServices{

  final storage = new FlutterSecureStorage();

  Future <LoginApiResponse> apiCallLogin(Map<String,dynamic> param) async{

    var url = Uri.parse('https://nskoffice.nutshellinfosoft.com/o2s/oauth/token');
    var response = await http.post(url, body: param);

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if(response.statusCode == 200 || response.statusCode == 201){
      Map<String, dynamic> output = json.decode(response.body);
      print(output["access_token"]);
      await storage.write(key: "access_token", value: output["access_token"]);
      await storage.write(key: "is_logged_in", value: "1");

    }

    final data = jsonDecode(response.body);
    return LoginApiResponse(token: data["token"], error: data["error"]);
  }
}


class LoginApiResponse{
  final String? token;
  final String? error;

  LoginApiResponse({this.token,this.error});

}