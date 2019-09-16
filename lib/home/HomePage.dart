import 'package:flutter/material.dart';

import 'HomeNavigationBar.dart';

import 'HomeCategory.dart';
import 'HomeSale.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: HomeAppBar(context).getHomeAppBar(),
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: ListView(
        
        children: <Widget>[
          HomeCategory(),
          HomeSale(),

        ],
      )

    );
  }





}
