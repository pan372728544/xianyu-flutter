import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeThirdFloor extends StatefulWidget {
  HomeThirdFloor({Key key}) : super(key: key);

  _HomeThirdFloorState createState() => _HomeThirdFloorState();
}

class _HomeThirdFloorState extends State<HomeThirdFloor> {
    var fontsize;
    var orientation;
    var fontsizesub;
    var fontsizestar;
    var fontsizestarsub;
  @override
  Widget build(BuildContext context) {
            // 记录屏幕方向
    orientation = MediaQuery.of(context).orientation;
    print(">>>>>>>>>>>>>build<<<<<<<<<<<<<<<<<");
    setState(() {
      // 屏幕旋转时候重新赋值字体大小
      fontsize = ScreenUtil().setSp(16.0);
      fontsizesub = ScreenUtil().setSp(12.0);
      fontsizestar = ScreenUtil().setSp(18.0);
      fontsizestarsub = ScreenUtil().setSp(14.0);
    });
    return SliverToBoxAdapter(
              child: Stack(
                    children: <Widget>[
                      // 白色背景
                      AspectRatio(
                        aspectRatio: 375/200,
                        child: Container(
                        margin: EdgeInsets.all(10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white
                        ),
                        child: Container(
                          
                          child: Stack(
                            children: <Widget>[
                              // 顶部
                              topWidget(),

                              // 中部
                              middleWidget(),

                              // 底部左侧
                              Align(
                                alignment: Alignment.bottomLeft,
                                child: MyButton("57类上门回收"),
                              ),
                              // 底部右侧
                              Align(
                                alignment: Alignment.bottomRight,
                                child: bottomWidget()
                            )
                            ],
                          ),

                        ),
                      ),
                      )
                    ],
                  )
    );
  }
}


class Sale {
  String title;
  String subtitle;
  String imageUrl;
  Color color;
  String horiz;
  String verti;
  Sale(this.title,this.subtitle,this.imageUrl,this.color,this.horiz,this.verti);
}


Widget middleWidget() {

  List<Sale> list = [

    Sale("发布闲置", "30秒发布宝贝", "https://gw.alicdn.com/bao/uploaded/i2/2975334258/O1CN01UAuTkD1hKD0UXVeLr_!!0-item_pic.jpg",Colors.orange,'Y','Y'),
    Sale("淘宝转卖", "网购宝贝一键发布", "https://gw.alicdn.com/bao/uploaded/i1/1796610007/O1CN01KOEcUQ1BvFKap9Fsf_!!0-item_pic.jpg",Colors.red,'Y','N'),
    Sale("信用回收", "先收钱 再寄货", "https://gw.alicdn.com/bao/uploaded/i4/3017649786/O1CN010uMdZv2MA2QtBoYFI_!!0-item_pic.jpg",Colors.blue,'N','N'),

  ];
  return Align(
    alignment: Alignment.center,
    child: AspectRatio(
    aspectRatio: 375/130,
    child: GridView.count(
    padding: EdgeInsets.only(top: 0),
    crossAxisCount: 2,
    childAspectRatio: (ScreenUtil.screenWidthDp/2)/((ScreenUtil.screenWidthDp*130/375)/2),
    physics: NeverScrollableScrollPhysics(),
    children: list.map((item){
      return _gridViewItem(item);
    }).toList(),
  )
 
  ),
  );

}

 // 单个分类视图
  Widget _gridViewItem( item) {
    return InkWell(
      onTap: () {
        /// 点击对应的item
        print(item.title);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(width: 1,color: item.horiz == 'Y'? Colors.grey[200]:Colors.white),
          right: BorderSide(width: 1,color:  item.verti == 'Y'? Colors.grey[200]:Colors.white))
        ),
        child: Row(
        
        // mainAxisAlignment:  MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            // 右侧图片
            padding: EdgeInsets.only(right: 10),
            child: Icon (
              Icons.cloud_circle,
              color: item.color,
              size: ScreenUtil().setWidth(40),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 10),
            
            child:  Column(
              // 对齐方式 左对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              // 标题
                Row(
                  children: <Widget>[
                    Text(
                      item.title,
                      style: TextStyle(
                        fontSize: ScreenUtil().setSp(16.0),
                        fontWeight: FontWeight.bold,
                        color: item.color
                       ),
                      ),
                  ],
                ),
              // 副标题
              Text(
                item.subtitle,
                style: TextStyle(fontSize: ScreenUtil().setSp(12.0), color: Colors.grey),
              )
            ],
          ),
          ),
         
         
        ],
      ),
      ),
    );
  }


Widget topWidget() {
  print("-------及阿里山的积分垃圾登陆---------🏠🏠🏠🏠🏠🏠");
 return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "卖闲置能换钱",
              style: TextStyle(
                fontSize: ScreenUtil().setSp(18.0),
                fontWeight: FontWeight.bold,
                color: Colors.black
          
              ),
              ),
              Text.rich( TextSpan(
                children: [

                  TextSpan(
                    text: "最新发布",
                     style: TextStyle(
                      fontSize: ScreenUtil().setSp(13.0),
                    )
                  ),
                  TextSpan(
                    text: "3378",
                    style: TextStyle(
                      fontSize: ScreenUtil().setSp(17.0),
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: "件闲置",
                     style: TextStyle(
                      fontSize: ScreenUtil().setSp(13.0),
                    )
                  ),

                ]
              )
              )
          ],

        );
}

class MyButton extends StatelessWidget {

  final String title;
  MyButton(this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: ScreenUtil().setWidth(140),
      padding: EdgeInsets.fromLTRB(10, 3, 0, 3),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20)
      ),
      child: InkWell(
        onTap: (){},
        
        child: Row(
          children: <Widget>[
            SizedBox(width: ScreenUtil().setWidth(10),),
            Text(
              title,
              style: TextStyle(fontSize: ScreenUtil().setSp(15.0),color: Colors.white),
            ),
            SizedBox(width: ScreenUtil().setWidth(10),),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: ScreenUtil().setWidth(13),
            )
          ],
        ),


      )
    );
  }
}

 Widget bottomWidget() {
 
  final List<Sale> list = [

      Sale("发布闲置", "30秒发布宝贝", "https://gw.alicdn.com/bao/uploaded/i2/2975334258/O1CN01UAuTkD1hKD0UXVeLr_!!0-item_pic.jpg",Colors.orange,'Y','Y'),
      Sale("淘宝转卖", "网购宝贝一键发布", "https://gw.alicdn.com/bao/uploaded/i1/1796610007/O1CN01KOEcUQ1BvFKap9Fsf_!!0-item_pic.jpg",Colors.red,'Y','N'),
      Sale("信用回收", "先收钱 再寄货", "https://gw.alicdn.com/bao/uploaded/i4/3017649786/O1CN010uMdZv2MA2QtBoYFI_!!0-item_pic.jpg",Colors.blue,'N','N'),

    ];

    return  AspectRatio(
      aspectRatio: 375/90,
      child: Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: list.map((item){
          return  bottomItem(item);
        }).toList()
      ),
    ),
    );
}



Widget bottomItem(item) {

    return AspectRatio(
      aspectRatio: 7/9,
      child: Container(
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Image.network(item.imageUrl),
          Text(item.title,style: TextStyle(fontSize: ScreenUtil().setSp(12.0)),)

        ],

      ),
    ),
    );
}