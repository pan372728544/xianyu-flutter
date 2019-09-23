
import 'package:flutter/material.dart';
import 'package:provide/provide.dart';

import './appbar/HomeTopAppBar.dart';
import './firstfloor/HomeFirstFloor.dart';
import 'HomeThirdFloor.dart';
import './fourthfloor/HomeFourthFloor.dart';
import './fifthfloor/HomeFifthFloor.dart';
import '../config/HttpMethod.dart';
import './fourthfloor/CommendModel.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import './fourthfloor/CommendProvider.dart';
import 'package:provide/provide.dart';
import './fifthfloor/HomeFifthContent.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{


  TabController _tabController;

  ScrollController _scrollController = ScrollController();

  // header的x值
  double headerx = 0.0;
  double scrollx = 0.0;
  @override
  void initState() {
    super.initState();
    headerx = ScreenUtil.screenWidthDp*340/375 + ScreenUtil.screenWidthDp*200/375;
  }

  @override
  Widget build(BuildContext context) {

    // 监听滚动
    _scrollController.addListener((){
      scrollx = _scrollController.offset;
        if ( scrollx >= headerx) {
          double persent =  (scrollx-headerx);
                  print(persent);
          // 设置tab背景颜色进度
          Provide.value<CommendProvider>(context).increment(persent>=1 ? 1.toDouble(): persent);
        } else {
          Provide.value<CommendProvider>(context).increment(0.0);
        }

    });
    return Scaffold(
      backgroundColor: Color.fromRGBO(237, 237, 237, 1),
      body: FutureBuilder(
        future: getHomeCommendData(),
        builder: (BuildContext context, AsyncSnapshot snapshot){
          // sleep(Duration(milliseconds: 500));
            if (snapshot.connectionState == ConnectionState.done) {
              // 服务器数据转为模型
              var commandModel = CommandModel.fromJson(snapshot.data);
               List<Titles> listData = commandModel.titles;
              // 设置tab
              this._tabController = TabController(length: listData.length,vsync:this);

              return CustomScrollView(
                controller: _scrollController,
                    slivers: <Widget>[
                      // 顶部导航栏
                      HomeTopAppBar(),
                      // 1楼
                      HomeFirstFloor(),
                      // 3️⃣楼
                      HomeThirdFloor(), 
                      // tab
                      HomeFourthFloor(tabController: _tabController,listData: listData,),
                      // tabView
                      HomeFifthFloor(tabController: _tabController,scrollController: _scrollController,),
                    ],
                  );
            }
            return Container(
                  child:  Center(
                    child: Image(
                      image: AssetImage('images/loading.gif'),
                    )
                  )
            );
        }
      )

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