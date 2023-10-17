import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meji_digital/LoginScreen.dart';
import 'package:meji_digital/models/UserModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserModel? userModel;
  TextEditingController textEditingControllerFirst=TextEditingController();
  TextEditingController textEditingControllerLast=TextEditingController();
  TextEditingController textEditingControllerEmail=TextEditingController();

  @override
  void initState() {
    super.initState();
    getData();
  }
  getData() async {
    var sp=await SharedPreferences.getInstance();
    String? str=sp.getString("user");
    print(str);
    if(str!=null && str.isNotEmpty){
      userModel=UserModel.fromJson(jsonDecode(str));
      textEditingControllerFirst.text=userModel!.firstName!;
      textEditingControllerLast.text=userModel!.lastName!;
      textEditingControllerEmail.text=userModel!.email!;
      setState(() {
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start  ,children: [
          SizedBox(height: 24,),
          Text("My Profile",style: TextStyle(color: Colors.deepPurple,fontSize: 18,fontWeight: FontWeight.bold),),
          SizedBox(height: 16,),
          Container(color: Colors.grey.withOpacity(.2),
            child: Row(
              children: [
                SizedBox(child: Container(color: Colors.deepPurple,width: 5,height: 65,)),
                SizedBox(width: 8,),
                Expanded(child: TextField(controller: textEditingControllerFirst,decoration: InputDecoration(labelText: "First Text",hintText: "Name"),)),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(color: Colors.grey.withOpacity(.2),
            child: Row(
              children: [
                SizedBox(child: Container(color: Colors.deepPurple,width: 5,height: 65,)),
                SizedBox(width: 8,),
                Expanded(child: TextField(controller: textEditingControllerLast,decoration: InputDecoration(labelText: "Last Text",hintText: "Name"),)),
              ],
            ),
          ),
          SizedBox(height: 8,),
          Container(color: Colors.grey.withOpacity(.2),
            child: Row(
              children: [
                SizedBox(child: Container(color: Colors.deepPurple,width: 5,height: 65,)),
                SizedBox(width: 8,),
                Expanded(child: TextField(controller: textEditingControllerEmail,decoration: InputDecoration(labelText: "Email",hintText: "Email"),)),
              ],
            ),
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(child: InkWell(onTap: (){
              },child: Container(height: 48,color: Colors.deepPurple,child: Center(child: Text("UPDATE MY ACCOUNT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),))),

            ],
          ),
          SizedBox(height: 24,),
          Row(
            children: [
              Expanded(child: InkWell(onTap: (){
                Get.to(()=>LoginScreen());
              },child: Container(height: 48,color: Colors.deepPurple.withOpacity(.5),child: Center(child: Text("LOGOUT",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),)),))),

            ],
          ),

        ],),
      ),),
    );
  }


}
