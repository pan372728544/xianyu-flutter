import 'package:flutter/material.dart';
import '../../config/HttpMethod.dart';
import 'CommendModel.dart';

class HomeFourthFloor extends StatefulWidget {
  final TabController tabController ;
  final List<Titles> listData;
  HomeFourthFloor({Key key,@required this.tabController,@required this.listData}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
   
   return SliverPersistentHeader(
     pinned: true,
     delegate: _SliverFourthBarDelegate(
       maxHeight: 40,
       minHeight: 40,
        child: TabBar(
                isScrollable: true,
                controller: widget.tabController,
                tabs: widget.listData.map((item){
                  return Tab(
                    child: Text(
                      item.title,
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
