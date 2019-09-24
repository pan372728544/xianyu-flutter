import 'package:flutter/material.dart';
import 'package:xianyu/home/fifthfloor/HomeFifthContent.dart';
import 'HomeFifthContent.dart';

class HomeFifthFloor extends StatefulWidget {
  final TabController tabController ;

  HomeFifthFloor({Key key,@required this.tabController}) : super(key: key);

  _HomeFifthFloorState createState() => _HomeFifthFloorState();
}

class _HomeFifthFloorState extends State<HomeFifthFloor> {

  List<HomeFifthContent> content = [];
  @override
  void initState() {
    super.initState();
    // 设置推荐内容视图数组
    for (var i = 0; i < widget.tabController.length; i++) {
      content.add(HomeFifthContent(index: i,));
    }
  }

  @override
  Widget build(BuildContext context) {

    return  Container(
      child: TabBarView(
              controller: widget.tabController,
              children: content.map((item){
                return item;
              }).toList(),
      
           ),
    );
  }
}
