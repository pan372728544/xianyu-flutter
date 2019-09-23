import 'package:flutter/material.dart';
import 'package:xianyu/home/fifthfloor/HomeFifthContent.dart';
import 'HomeFifthContent.dart';

class HomeFifthFloor extends StatefulWidget {
  final TabController tabController ;
  final ScrollController scrollController;
  HomeFifthFloor({Key key,@required this.tabController,@required this.scrollController}) : super(key: key);

  _HomeFifthFloorState createState() => _HomeFifthFloorState();
}

class _HomeFifthFloorState extends State<HomeFifthFloor> {

  List<HomeFifthContent> content = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
 
    for (var i = 0; i < widget.tabController.length; i++) {
      content.add(HomeFifthContent(index: i,));
    }
  }

  @override
  Widget build(BuildContext context) {

    return SliverFillViewport(
      // viewportFraction: 1.0,
      delegate: SliverChildListDelegate([
        Container(
          child: TabBarView(
              controller: widget.tabController,
              children: content.map((item){
                return item;
              }).toList(),
            ),
        ),
      ]),
      
    );
  }
}
