import 'package:flutter/material.dart';

import './appbar/HomeTopAppBar.dart';
import './firstfloor/HomeFirstFloor.dart';
import 'HomeThirdFloor.dart';
import './fourthfloor/HomeFourthFloor.dart';
import './fifthfloor/HomeFifthFloor.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{


  TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this._tabController = TabController(length: 3,vsync:this);
  }

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
          HomeFourthFloor(tabController: _tabController,),
        
          HomeFifthFloor(tabController: _tabController),

        ],

      ),

    );
  }

}



/* 另一种写法
class HomeScreen extends StatefulWidget {
  HomeScreen({Key key}) : super(key: key);

  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final List<String> myTabs = <String>[
   '最新2', //listType是参数值
   '附近', 
    '推荐', 
    '鉴定', 
    '实体认证',
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: myTabs.length,
        child: NestedScrollView(
                  headerSliverBuilder: (context,scrol){
                    return <Widget>[

                        SliverToBoxAdapter(
                          child: Container(
                            color: Colors.red,
                            height: 100,
                          ),
                        ),

                        SliverToBoxAdapter(
                          child: Container(
                            color: Colors.red,
                            height: 100,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Container(
                            color: Colors.orange,
                            height: 80,
                          ),
                        ),
                     SliverToBoxAdapter(
                          child: Container(
                            color: Colors.blue,
                            height: 180,
                          ),
                        ),
                       SliverOverlapAbsorber(
                          handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                          child:  SliverPersistentHeader(
                            pinned:  true,
                            delegate: _SliverFourthBarDelegate1(
                              maxHeight: 40,
                              minHeight: 40,
                              
                              child: TabBar(
                                tabs: myTabs.map((item){
                                  return Tab(
                                    child: Text(item
                                      ,style: TextStyle(color: Colors.black),
                                    ),

                                  );
                                }).toList(),
                              )
                            ),
                          )
                        ),


                    ];
                    
                  },
                  body: TabBarView(
                    children: myTabs.map((item){
                      return Container(
                        height: 100,
                        color: Colors.white,
                        child: Text(item),
                      );
                    }).toList(),
                  )

        ),

      ),


    );
  }
}




// 实现header代理
class _SliverFourthBarDelegate1 extends SliverPersistentHeaderDelegate {

  _SliverFourthBarDelegate1({
      @required this.minHeight,
    @required this.maxHeight,
    @required this.child,
   });

    final double minHeight;
    final double maxHeight;
    final Widget child;

    @override
  // TODO: implement minExtent
  double get minExtent => minHeight;
  @override
  // TODO: implement maxExtent
  double get maxExtent => maxHeight;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child,);;
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    // TODO: implement shouldRebuild
    return true;
  }
}

*/