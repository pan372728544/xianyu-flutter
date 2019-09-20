import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../config/HttpMethod.dart';
/// 明星在闲鱼



class HomeSecondFloor extends StatefulWidget {
  HomeSecondFloor({Key key}) : super(key: key);

  _HomeSecondFloorState createState() => _HomeSecondFloorState();
}

class _HomeSecondFloorState extends State<HomeSecondFloor> {
    var fontsize;
    var orientation;
    var fontsizesub;
    var fontsizestar;
    var fontsizestarsub;
  @override
  Widget build(BuildContext context) {

        // 记录屏幕方向
    orientation = MediaQuery.of(context).orientation;
    setState(() {
      // 屏幕旋转时候重新赋值字体大小
      fontsize = ScreenUtil().setSp(16.0);
      fontsizesub = ScreenUtil().setSp(12.0);
      fontsizestar = ScreenUtil().setSp(18.0);
      fontsizestarsub = ScreenUtil().setSp(14.0);
    });
        // 白色背景容器
    return FutureBuilder(

      // 请求分类数据
      future: getHomeCategoryStarData(),

      // 成功之后会指向 下面方法
      builder: (context,snapshot){

        // 如果有数据会返回Container页面
        if (snapshot.hasData){
          // 总的数据
         Map starData =  (snapshot.data).cast();
         // 顶部数据
         List topList = starData['array'];
         // 底部数据
         Map bottomData = starData['star'];
          return  Stack(
              children: <Widget>[

              // 顶部 ===========================
                AspectRatio(
                  aspectRatio: 375/140,
                  child: Container(
                    child: GridView.count(
                        crossAxisCount: 2,
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                        physics: NeverScrollableScrollPhysics(),
                        childAspectRatio: ((ScreenUtil.screenWidthDp-20)/2) / (ScreenUtil.screenWidthDp*(130)/375/2),
                      children: topList.map((item){
                        return _gridViewItem(context,item,fontsize,fontsizesub);
                      }).toList(),
                    ),
                    ),
                ),

                // 底部================================
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  AspectRatio(
                    aspectRatio: 375/40,
                    child: Container(
                    child: _starViewItem(context,bottomData,fontsizestar,fontsizestarsub),
                  ),
                  ),
                )
              ],
  
          );
        } else {
          // 没有数据返回一个占位的视图
         return Container(
                // 间距
                margin: EdgeInsets.all(10),
                // 装饰
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20), color: Colors.white),
                child: Stack(
                  children: <Widget>[
                    Center(
                      child: Text(
                        '正在获取到数据...',
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


 // 单个分类视图
  Widget _gridViewItem(BuildContext context, item,fontsize,fontsizesub) {
    return InkWell(
      onTap: () {
        /// 点击对应的item
        print(item['title']);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: Colors.grey[200]),right: BorderSide(width: 1,color: item["key"]  == ""  ?Colors.grey[200]: Colors.white))
        ),
        child: Row(
        
        mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(5, 5, 0, 5),
            child:  Column(
              // 对齐方式 左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 标题
                Row(
                  children: <Widget>[
                    Text(
                      item['title'],
                      style: TextStyle(
                        fontSize: fontsize,
                        fontWeight: FontWeight.bold,
                       ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: item["key"]  == ""  ? Colors.white : Colors.orange
                          
                        ),
                        padding: EdgeInsets.only(left: 4,right: 4),
                        child: Text(
                        item["key"],
                        style: TextStyle(
                          fontSize: fontsizesub,
                          color: Colors.white,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      ),
                  ],
                ),
              // 副标题
              Text(
                item['subtitle'],
                style: TextStyle(fontSize: fontsizesub, color: Colors.grey),
              )
            ],
          ),
          ),
          Container(
            // 右侧图片
            child:  Image.network(
              item['imageUrl'],
              fit: BoxFit.cover,
            ),
          )
         
        ],
      ),
      ),
    );
  }



 // 底部视图
  Widget _starViewItem(BuildContext context, item,fontsizestar,fontsizestarsub) {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10),
      child: InkWell(
    
      onTap: () {
        /// 点击对应的item
        print(item['title']);
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            item['title'],
            style: TextStyle(
              fontSize: fontsizestar,
              fontWeight: FontWeight.bold,
              color: Colors.pink,
            ),
          ),
          // 标题
          Text(
            item['subtitle'],
            style: TextStyle(fontSize: fontsizestarsub, color: Colors.black, ),
          ),
          Image.network(item['imageUrl'])
              
        ],

      ),
    ),
    );
  }