
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
// 服务地址配置
import '../config/HttpMethod.dart';

import 'HomeStar.dart';

class HomeCategory extends StatefulWidget {
  HomeCategory({Key key}) : super(key: key);
  _HomeCategoryState createState() => _HomeCategoryState();
}

class _HomeCategoryState extends State<HomeCategory> {
  @override
  Widget build(BuildContext context) {
    // 白色背景容器
    return FutureBuilder(
      // 请求分类数据
      future: getHomeCategoryData(),

      // 成功之后会指向 下面方法
      builder: (context, snapshot) {
        // 如果有数据会返回Container页面
        if (snapshot.hasData) {
          List<Map> categoryList = (snapshot.data as List).cast();
          return Container(
            height: 340,
            decoration: BoxDecoration(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),

            child: Stack(
              children: <Widget>[

                Container(
                  // 主题背景颜色
                  height: 220,
                   decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),
                ),
                  // ====================================分类视图顶部
                 Container( 
                  // 父视图间距   
                  margin: EdgeInsets.only(top: 10,left: 10,right: 10,bottom: 180),
                  // 装饰
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: categoryList.length,
                    padding: EdgeInsets.only(top: 5),
                    itemBuilder: (context,index){
                        return _gridViewItem(context, categoryList[index]);

                    },
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 70,
                      crossAxisSpacing: 10
                    ),
                  )

                ),
                  // 明星容器 ====================================分类视图底部
                 Container(
                    margin: EdgeInsets.only(top: 170,left: 10,right: 10,bottom: 0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: HomeStar(),  
                ),
              ],
            ),
          );
        } else {
          // 没有数据返回一个占位的视图
          return Container(
              // 设置高度
              height: ScreenUtil().setHeight(200),
              // 间距
              margin: EdgeInsets.all(10),
              // 装饰
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: Colors.white),
              child: Stack(
                children: <Widget>[
                  Center(
                    child: Text(
                      '还没有获取到数据',
                      style: TextStyle(fontSize: 30.0, color: Colors.orange),
                    ),
                  )
                ],
              ));
        }
      },
    );
  }

  // 单个分类视图
  Widget _gridViewItem(BuildContext context, item) {
    return Container(
      // color: item["title"] == '数码' ? Colors.orange : Colors.white,
      child: InkWell(
      onTap: () {
        /// 点击对应的item
        print(item['title']);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
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
                style: TextStyle(fontSize: 12.0, color: Colors.black),
              ),
          )
        ],
      ),
    ),

    );
  }
}
