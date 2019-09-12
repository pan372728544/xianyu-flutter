import 'package:flutter/material.dart';

class FishpondPage extends StatefulWidget {
  FishpondPage({Key key}) : super(key: key);

  _FishpondPageState createState() => _FishpondPageState();
}

class _FishpondPageState extends State<FishpondPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("鱼塘"),
      ),
      body: Row(
        children: <Widget>[
          Container(
            height: 100,
           child: Column(
            children: <Widget>[
              Text("asdfasdfasdf"),
              Text("sssssss")
            ],

          ),
          ),
          
          Container(
            height: 100,
            child: Text("加上了对方"),
          )



        ],


      )

    );
  }
}