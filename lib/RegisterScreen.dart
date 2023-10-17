import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:meji_digital/main.dart';
import 'package:meji_digital/utils/HttpService.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Tabs/HomeScreen.dart';
import 'models/UserModel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController textEditingControllerFirst=TextEditingController();
  TextEditingController textEditingControllerLast=TextEditingController();
  TextEditingController textEditingControllerEmail=TextEditingController();
  TextEditingController textEditingControllerPassword=TextEditingController();

  registerFunction() async {
    if(textEditingControllerFirst.text.isEmpty || textEditingControllerLast.text.isEmpty || textEditingControllerEmail.text.isEmpty || textEditingControllerPassword.text.isEmpty){
      Fluttertoast.showToast(msg: "Fill all the details");
      return;
    }

    var response=await HttpService.registerMethod(textEditingControllerFirst.text,textEditingControllerLast.text,textEditingControllerEmail.text,textEditingControllerPassword.text);
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
            Text("Meji",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,color: Colors.deepPurple),),
            Text("Sign Up with Your Email Address",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.deepPurple),),
            SizedBox(height: 16,),
            TextField(controller: textEditingControllerFirst,decoration: InputDecoration(label: Text("First Name"))),
            TextField(controller: textEditingControllerLast,decoration: InputDecoration(label: Text("Last Name"))),
            TextField(controller: textEditingControllerEmail,decoration: InputDecoration(label: Text("Email"))),
            TextField(controller: textEditingControllerPassword,decoration: InputDecoration(label: Text("Password")),obscureText: true,),
            SizedBox(height: 24,),
            Row(
              children: [
                Expanded(child: InkWell(onTap: (){
                  registerFunction();
                },child: Container(height: 48,color: Colors.deepPurple,child: Center(child: Text("CREATE ACCOUNT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),))),

              ],
            ),
          ],),
        ),
      ),

    );
  }
}
