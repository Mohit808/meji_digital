import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
class HttpService{

  static String baseURL="https://api.lyfcon.com/auth/demo/";
  static String login="login";
  static String createUser="create-user";



  static loginMethod(email,pass) async {
    var response=await http.post(Uri.parse("$baseURL$login"),body: {"email":"$email","password":"$pass"});
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var json=jsonDecode(response.body);
      if(json['firstName']!=null){
        return json;  
      }else{
        Fluttertoast.showToast(msg: json['error']);
      }
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }

  static registerMethod(firstName,lastName,email,pass) async {
    var response=await http.post(Uri.parse("$baseURL$createUser"),body: {"firstName":"$firstName","lastName":"$lastName","email":"$email","password":"$pass"});
    print(response.statusCode);
    print(response.body);
    if(response.statusCode==200){
      var json=jsonDecode(response.body);
      if(json['firstName']!=null){
        return json;
      }else{
        Fluttertoast.showToast(msg: json['error']);
      }
    }else{
      Fluttertoast.showToast(msg: "Something went wrong");
    }
  }
}
