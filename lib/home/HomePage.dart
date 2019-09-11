import 'package:flutter/material.dart';

import 'HomeNavigationBar.dart';

import 'HomeCategory.dart';

import '../config/ServiceUrl.dart';
import '../config/HttpMethod.dart';

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
          Container(
            padding: EdgeInsets.only(top: 10),
            child: Text(
            "首页数据二楼",
            style: TextStyle(
              fontSize: 100,
              backgroundColor: Colors.blue
          
            ),
            ),
          )

        ],
      )

    );
  }





}
