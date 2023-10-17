import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:meji_digital/RegisterScreen.dart';
import 'package:http/http.dart';
import 'package:meji_digital/Tabs/HomeScreen.dart';
import 'package:meji_digital/main.dart';
import 'package:meji_digital/models/UserModel.dart';
import 'package:meji_digital/utils/HttpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController textEditingControllerEmail=TextEditingController(text: "codingskills-demo101@mejidigital.in");
  TextEditingController textEditingControllerPass=TextEditingController(text: "demo101");
  loginFunction() async {
    if(textEditingControllerEmail.text.isEmpty || textEditingControllerPass.text.isEmpty){
      Fluttertoast.showToast(msg: "Fill all the details");
      return;
    }

    var response=await HttpService.loginMethod(textEditingControllerEmail.text,textEditingControllerPass.text);
    if(response!=null){
      var sp=await SharedPreferences.getInstance();
      sp.setString("user", jsonEncode(response));
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (builder)=>MyHomePage()));

    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(children: [
            SizedBox(height: 150,),
            Text("Welcome To",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepPurple),),
            Text("Meji",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepPurple),),
            SizedBox(height: 16,),
            TextField(controller: textEditingControllerEmail,decoration: InputDecoration(labelText: "Email Address")),
            SizedBox(height: 8,),
            TextField(controller: textEditingControllerPass,decoration: InputDecoration(label: Text("Password")),obscureText: true,),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(child: InkWell(onTap: (){
                  loginFunction();
                },child: Container(height: 48,color: Colors.deepPurple,child: Center(child: Text("LOGIN",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),))),

              ],
            ),
            SizedBox(height: 16,),
            Row(
              children: [
                InkWell(onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (builder)=>RegisterScreen()));
                },child: Text("Create new account",style: TextStyle(decoration: TextDecoration.underline,color: Colors.blue),)),
              ],
            )
          ],),
        ),
      ),
    );
  }
}
