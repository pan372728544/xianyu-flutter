import 'package:flutter/material.dart';

class HomeFifthFloor extends StatefulWidget {
  final TabController tabController ;
  HomeFifthFloor({Key key,@required this.tabController}) : super(key: key);

  _HomeFifthFloorState createState() => _HomeFifthFloorState();
}

class _HomeFifthFloorState extends State<HomeFifthFloor> {
  @override
  Widget build(BuildContext context) {
    return SliverFillViewport(
      viewportFraction: 1.0,
      delegate: SliverChildListDelegate([
        Container(
          color: Colors.pinkAccent.withOpacity(0.3),
          child: TabBarView(
              controller: widget.tabController,
              children: <Widget>[
                Center(child: Text('Content of 1')),
                Center(child: Text('Content of 2')),
                 Center(child: Text('Content of 3')),
                           Center(child: Text('Content of 1')),
                Center(child: Text('Content of 2')),
                 Center(child: Text('Content of 3')),
                           Center(child: Text('Content of 1')),
                Center(child: Text('Content of 2')),
                 Center(child: Text('Content of 3')),
                           Center(child: Text('Content of 1')),
              ],
            ),
        ),
      ]),
      
    );
  }
}