import 'package:flutter/material.dart';

import './appbar/HomeTopAppBar.dart';
import './firstfloor/HomeFirstFloor.dart';
import 'HomeThirdFloor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: CustomScrollView(
        
        slivers: <Widget>[
          // 顶部导航栏
          HomeTopAppBar(),
          HomeFirstFloor(),
          HomeThirdFloor(),

        ],

      ),

    );
  }

}
