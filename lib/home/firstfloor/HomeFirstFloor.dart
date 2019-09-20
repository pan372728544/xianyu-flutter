
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// 网络请求
import '../../config/HttpMethod.dart';

import '../HomeSecondFloor.dart';


class HomeFirstFloor extends StatefulWidget {
  HomeFirstFloor({Key key}) : super(key: key);

  _HomeFirstFloorState createState() => _HomeFirstFloorState();
}

class _HomeFirstFloorState extends State<HomeFirstFloor> {
  var fontsize;
  var orientation;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fontsize = ScreenUtil().setSp(12.0);
  }

  @override
  Widget build(BuildContext context) {
    var screenW = ScreenUtil.screenWidthDp;
    var count = 5;
    // 记录屏幕方向
    orientation = MediaQuery.of(context).orientation;
    setState(() {
      // 屏幕旋转时候重新赋值字体大小
      fontsize = ScreenUtil().setSp(12.0);

    });
    // print("宽度：${ScreenUtil.screenHeightDp}   高度：${orientation}===${ScreenUtil().setSp(12.0)}");
    return SliverToBoxAdapter(
      child: FutureBuilder(
      // 请求分类数据
      future: getHomeCategoryData(),

      builder: (context, snapshot) {
        // sleep(Duration(seconds: 2));
        // 判断是否有返回数据
        if (snapshot.hasData) {
          // 服务器返回的分类数据列表
          List<Map> categoryList = (snapshot.data as List).cast();
          return AspectRatio(
            aspectRatio: 375/340,
            child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),

            child: Stack(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 375/180,
                  child: Container(
                  // 主题背景颜色
                   decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),
                ),
                ),

                // 分类视图顶部=================start===================
                AspectRatio( 
                  aspectRatio: 375/160,
                  child:  Container( 
                    // 父视图间距   
                    margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    // 白色圆角
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white),

                    // 网格视图    
                    child: GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: categoryList.length,
                      padding: EdgeInsets.only(top: 0),
                      itemBuilder: (context,index){
                          return _gridViewItem(context, categoryList[index]);

                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: count,
                        childAspectRatio: ((screenW-20)/5)/((screenW*(160-10)/375)/2),
                      ),
                    )

                  ),
                ),
                // 分类视图顶部=================end===================

                // =================start===================分类视图底部
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  AspectRatio(
                    aspectRatio: 375/180,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white
                          ),
                          child: HomeSecondFloor(),  
                    ),
                  )
                )
               // =================end===================分类视图底部 

              ],
            ),
          ),
          );
        } else {
          // 没有数据返回一个占位的视图
          return Container(
                  padding: EdgeInsets.all(30),
                  color: Colors.white,
                  child: Text(
                    "正在加载中...",
                    style: TextStyle(fontSize: 20),
                    textAlign: TextAlign.center,
                    )
          );


        }
      },
    ),

    );
  }


// 单个分类视图
  Widget _gridViewItem(BuildContext context, item) {
    return Container(
      // color: item["title"] == '数码' ? Colors.orange : Colors.red,
      child: InkWell(
      onTap: () {
        /// 点击对应的item
        print(item['title']);
      },
      child: Column(
        // mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded(
            flex: 3,
            // 图片数据
           child: Image.network(
              item['imageUrl'],
              fit: BoxFit.fill,
            )
          ),
          Expanded(
            flex: 1,
            child: Text(
                item['title'],
                style: TextStyle(fontSize: fontsize, color: Colors.black),
              ),
          )
        ],
      ),
    ),

    );
  }



}