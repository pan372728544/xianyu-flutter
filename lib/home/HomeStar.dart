import 'package:flutter/material.dart';
import '../config/HttpMethod.dart';
/// 明星在闲鱼



class HomeStar extends StatefulWidget {
  HomeStar({Key key}) : super(key: key);

  _HomeStarState createState() => _HomeStarState();
}

class _HomeStarState extends State<HomeStar> {
  @override
  Widget build(BuildContext context) {
        // 白色背景容器
    return FutureBuilder(

      // 请求分类数据
      future: getHomeCategoryStarData(),

      // 成功之后会指向 下面方法
      builder: (context,snapshot){

        // 如果有数据会返回Container页面
        if (snapshot.hasData){
         Map categoryList =  (snapshot.data).cast();
          print("aaaaaa   $categoryList");
          return  Stack(
              children: <Widget>[
               
               Container(
                  // 设置高度
                height: 200,
                // 装饰
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.pink),
               )
               
              ],
  
          );
        } else {
          // 没有数据返回一个占位的视图
         return Container(
                // 设置高度
                height: 200,
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
                        style: TextStyle(
                          fontSize: 30.0,
                          color: Colors.orange
                        ),
                        ),
                    )
                  ],
                )
              );
        }
      },
      
    );
  }
}