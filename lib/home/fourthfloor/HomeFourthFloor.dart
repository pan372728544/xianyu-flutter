import 'package:flutter/material.dart';
import 'CommendModel.dart';
import 'package:provide/provide.dart';
import 'CommendProvider.dart';

class HomeFourthFloor extends StatefulWidget {
  final TabController tabController ;
  final List<Titles> listData;
  HomeFourthFloor({Key key,@required this.tabController,@required this.listData}) : super(key: key);

  _HomeFourthFloorState createState() => _HomeFourthFloorState();
}

class _HomeFourthFloorState extends State<HomeFourthFloor> {
   
  @override
  Widget build(BuildContext context) {
   return SliverPersistentHeader(
     pinned: true,
     delegate: _SliverFourthBarDelegate(
       maxHeight: 40,
       minHeight: 40,
        child: Provide<CommendProvider>(
          builder: (context,child,commend) {
           return Container(
                      color: Colors.white.withOpacity(commend.value),
                      child: TabBar(
                        // 指示条
                        indicatorWeight: 4.0,
                        isScrollable: true,
                        // 宽度
                        indicatorSize: TabBarIndicatorSize.label,
                        controller: widget.tabController,
                        labelColor: Colors.blue,
                        unselectedLabelColor: Colors.red,
                        labelStyle: TextStyle(
                          fontSize: 15.0
                        ),
                        unselectedLabelStyle: TextStyle(
                           fontSize: 14.0
                        ),
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
                      ),
                    );
          },

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
