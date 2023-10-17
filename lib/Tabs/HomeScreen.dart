import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {

  TabController? tabController;

  @override
  void initState() {
    tabController=TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [
          TabBar(isScrollable: true,controller: tabController,tabs: [
            Tab(text: "Latest",),
            Tab(text: "Jobs",),
            Tab(text: "Properties",),
            Tab(text: "Cars",),
            Tab(text: "Services",),
            Tab(text: "Plans",),
          ],),
          SizedBox(height: 16,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(padding: EdgeInsets.only(left: 16,right: 16),decoration: BoxDecoration(color: Colors.grey.withOpacity(.5),borderRadius: BorderRadius.circular(10)),
              child: Row(children: [
                Icon(Icons.search),
                Expanded(child: TextField(decoration: InputDecoration(hintText: "Search...",border: InputBorder.none),)),
                Icon(Icons.filter_alt_rounded),
              ],),
            ),
          ),
          SizedBox(height: 24,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: ListView.builder(physics: NeverScrollableScrollPhysics(),shrinkWrap: true,itemCount: 2,itemBuilder: (itemBuilder,index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [

                  Text("UAE pays tribute to life and lagacy of sheikh Khalifa",style: TextStyle(fontWeight: FontWeight.bold),),
                  Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry."),
                  SizedBox(height: 8,),
                  SizedBox(height: 200,child: Row(
                    children: [
                      Expanded(child: ClipRRect(borderRadius: BorderRadius.circular(8),child: Image.network("https://images.pexels.com/photos/442579/pexels-photo-442579.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",fit: BoxFit.cover,))),
                    ],
                  )),
                ],),
              );
            }),
          ),

          Container(color: Colors.grey.withOpacity(.2),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16,),
                Text("  Book Services",style: TextStyle(color: Colors.blue,fontWeight: FontWeight.bold,fontSize: 18),),
                SizedBox(height: 16,),
                SizedBox(height: 150,
                  child: ListView.builder(scrollDirection: Axis.horizontal,itemCount: 3,itemBuilder: (itemBuilder,index){
                    return SizedBox(width: 150,child: Padding(
                      padding: const EdgeInsets.only(left: 8.0,right: 8),
                      child: Column(children: [
                        Container(decoration: BoxDecoration(color: Colors.grey.withOpacity(.3),borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))),height: 100,child: Center(child: Text("Services"))),
                        Container(height: 50,decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))),child: Center(child: Text("Local Delivery"))),

                      ],),
                    ),);
                  }),
                ),
                SizedBox(height: 24 ,)
              ],
            ),
          )

        ],),
      ),
    );
  }
}
