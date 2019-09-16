import 'package:flutter/material.dart';

class MessagePage extends StatefulWidget {
  MessagePage({Key key}) : super(key: key);

  _MessagePageState createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("消息"),
      ),
      body: Container(
        child: GridView.count(
          crossAxisCount: 5,
          childAspectRatio: 1.4,
          children: <Widget>[
            Container(
              color: Colors.red,
              child:  Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                   child: Icon(Icons.save_alt),
                ),
                Expanded(
                  flex: 1,
                  child:  Text("ajsldjflasj"),
                )
                
              ],
            ),
            )
           ,
            Container(
              color: Colors.blue,
              child: Column(
              children: <Widget>[
                 Icon(Icons.save_alt),
                 Text("ajsldjflasj")
              ],
            ),
            ),
            Column(
              children: <Widget>[
                 Icon(Icons.save_alt),
                 Text("ajsldjflasj")
              ],
            ),
            Column(
              children: <Widget>[
                 Icon(Icons.save_alt),
                 Text("ajsldjflasj")
              ],
            ),
            Column(
              children: <Widget>[
                 Icon(Icons.save_alt),
                 Text("ajsldjflasj")
              ],
            ),
            Column(
              children: <Widget>[
                 Icon(Icons.save_alt),
                 Text("ajsldjflasj")
              ],
            ),

          ],

        ),


      ),

    );
  }
}