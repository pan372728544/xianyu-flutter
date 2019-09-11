import 'package:flutter/material.dart';

class HomeScanPage extends StatelessWidget {

  final arguments;
  HomeScanPage({this.arguments});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar:  AppBar(
        title: Text("${arguments['pageName']}"),
        
      ),
      body:  Center(

        child: Text("${arguments['pageContent']}"),

      ),

    );
  }
}
