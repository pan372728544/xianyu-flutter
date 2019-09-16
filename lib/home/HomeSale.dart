import 'package:flutter/material.dart';

class HomeSale extends StatefulWidget {
  HomeSale({Key key}) : super(key: key);

  _HomeSaleState createState() => _HomeSaleState();
}

class _HomeSaleState extends State<HomeSale> {
  @override
  Widget build(BuildContext context) {
    return Stack(
  
       children: <Widget>[
         // 白色背景
         Container(
           height: 220,
           margin: EdgeInsets.all(10),
           padding: EdgeInsets.all(10),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(20),
             color: Colors.white
           ),
           child: Container(
             child: Stack(
               children: <Widget>[
                topWidget(),
                middleWidget(),
                MyButton("57类上门回收"),
               Align(
                  alignment: Alignment.bottomRight,
                  child: bottomWidget(),
               )
                

               ],



             ),

           ),
         )


       ],
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
  return GridView.extent(
    maxCrossAxisExtent: 280,
    childAspectRatio: 2.5,
    physics: NeverScrollableScrollPhysics(),
    padding: EdgeInsets.only(top: 30),
    children: list.map((item){
      return _gridViewItem(item);
    }).toList()
 
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
              size: 40,
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: item.color
                       ),
                      ),
                  ],
                ),
              // 副标题
              Text(
                item.subtitle,
                style: TextStyle(fontSize: 12.0, color: Colors.grey),
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
 return  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          
          children: <Widget>[
            Text(
              "卖闲置能换钱",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black
          
              ),
              ),
              Text.rich( TextSpan(
                children: [

                  TextSpan(
                    text: "最新发布"
                  ),
                  TextSpan(
                    text: "3378",
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  TextSpan(
                    text: "件闲置"
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
      width: 140,
      margin: EdgeInsets.only(top: 170),
      padding: EdgeInsets.fromLTRB(10, 3, 0, 3),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20)
      ),
      child: InkWell(
        onTap: (){},
        
        child: Row(
          children: <Widget>[
            Text(
              title,
              style: TextStyle(fontSize: 15,color: Colors.white),
            ),
            SizedBox(width: 10,),
            Icon(
              Icons.arrow_forward_ios,
              color: Colors.white,
              size: 13,
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

    return Container(
      height: 90,
      width: 210,
      // color: Colors.orange,
      child: Row(

        children: list.map((item){
          return  bottomItem(item);
        }).toList()

      ),
    );
}



Widget bottomItem(item) {

    return Container(
      width: 70,
      height: 90,
      child: Column(
        children: <Widget>[
          Image.network(item.imageUrl),
          Text(item.title,style: TextStyle(fontSize: 12),)

        ],

      ),
    );
}