import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'Tabs/CartScreen.dart';
import 'Tabs/PlaceAnAd.dart';
import 'Tabs/HomeScreen.dart';
import 'Tabs/MyOrders.dart';
import 'Tabs/ProfileScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin{

  TabController? tabController;
  int selectIndex=0;

  var pages=[
    HomeScreen(),
    MyOrders(),
    PlaceAnAd(),
    CartScreen(),
    ProfileScreen()
  ];

  @override
  void initState() {
    tabController=TabController(length: 5, vsync: this);
    tabController!.addListener(() {
      selectIndex=tabController!.index;
      setState(() {
      });
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Meji"),
        centerTitle: true,
      ),

        body: pages[selectIndex],
        bottomNavigationBar: TabBar(controller: tabController,tabs: [
          Tab(icon: Icon(Icons.home),text: "Home",),
          Tab(icon: Icon(Icons.fact_check),text: "My Orders",),
          Tab(icon: Icon(Icons.add_circle_outlined),text: "Place an Ad",),
          Tab(icon: Icon(Icons.shopping_cart_outlined),text: "Cart",),
          Tab(icon: Icon(Icons.person),text: "My Account",),
        ],)

    );
  }
}
