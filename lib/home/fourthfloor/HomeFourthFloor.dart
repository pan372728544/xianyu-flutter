import 'package:flutter/material.dart';

class HomeFourthFloor extends StatefulWidget {
  final TabController tabController ;
  HomeFourthFloor({Key key,@required this.tabController}) : super(key: key);

  _HomeFourthFloorState createState() => _HomeFourthFloorState();
}

class _HomeFourthFloorState extends State<HomeFourthFloor>  with SingleTickerProviderStateMixin{
   


  // TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("////////////////////pppp   ${widget.tabController.length}");
    // this._tabController = TabController(length: tabs.length,vsync:this);
  }

  final List tabs = <String>[
    '推荐',
    '手机',
    '电脑',
  ];


  @override
  Widget build(BuildContext context) {
   
   return SliverPersistentHeader(
     pinned: true,
     delegate: _SliverFourthBarDelegate(
       maxHeight: 40,
       minHeight: 40,
       child: TabBar(
         controller: widget.tabController,
         tabs: tabs.map((item){
           return Tab(
             child: Text(
               item,
              style: TextStyle(
                color: Colors.black
              ),
             ),
           );
         }).toList(),
       )
     ),
   );
  }

}


// 实现header代理
class _SliverFourthBarDelegate extends SliverPersistentHeaderDelegate {
     final double minHeight;
    final double maxHeight;
    final Widget child;
 
  _SliverFourthBarDelegate({@required this.child,   @required this.minHeight,
    @required this.maxHeight,});
 
  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    // return this.child;
    return SizedBox.expand(child: child,);
  }
 
  @override
  double get maxExtent => maxHeight;
 
  @override
  double get minExtent => minHeight;
 
  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
