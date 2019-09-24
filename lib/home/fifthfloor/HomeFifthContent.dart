import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provide/provide.dart';
import 'package:xianyu/home/fifthfloor/ProductItem.dart';
import 'ProductProvide.dart';

class HomeFifthContent extends StatefulWidget {
  HomeFifthContent({Key key,this.index}) : super(key: key);

  // 索引 关注 新鲜 附近 手机等
  final int index;
  _HomeFifthContentState createState() => _HomeFifthContentState();
}

class _HomeFifthContentState extends State<HomeFifthContent> {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Provide.value<ProductProvide>(context).getProducts(1, 1);
    print("========================================================ProductProvide============");
    return  Provide<ProductProvide>(
      builder: (context,child,product){
        return Container(
          child: StaggeredGridView.countBuilder(
          padding: EdgeInsets.all(10),
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          itemCount: product.products.length,
          itemBuilder: (BuildContext context, int index){
            Product endProduct = product.products[index];
            if (endProduct.key == "end") {
              // return Container(
              //   height: 40,
              //   color: Colors.red,
              //   child: Text("加载数据。。。。",style: TextStyle(backgroundColor: Colors.red,fontSize: 10)),
              // );
              return CircularProgressIndicator(strokeWidth: 2.0);
            } else {
            print("dangqian     $index");
            return _productWidget(product.products[index],index);
            }

          },
          staggeredTileBuilder: (int index){
              Product endProduct = product.products[index];
            if (endProduct.key == "end") {
            
            return StaggeredTile.extent(2, 40);
            } else {
           
           return StaggeredTile.count(1, index.isEven ? 1.3 : 1.6);
            }

          },
        ),

        );

      },


    );
  }
}

// 商品单个数据
Widget _productWidget(Product product,int index){

  return Container(

    // 背景圆角白色
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
     color: Colors.white,
    ),

    child: Column(

      children: <Widget>[

        // 商品图片
            Expanded(
              flex: index.isEven ? 5 : 8,
              child: Container(
                child: Image.network(
                product.productUrl,
                fit: BoxFit.fill,
                ),
              ),
            ),


            // 商品名称
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Text(
                product.productTitle,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  
                ),
                ),
              )
            ),

            // 商品价格
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey[100],width: 1))
                ),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    product.price,
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    ),
                    
                  ),
                  Text(product.count,style: TextStyle(fontSize: 11),)
                ],

              ),
              ),
            ),

            // 卖家信息
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    child:      Image.network(product.userUrl),
                    padding: EdgeInsets.all(5),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(0, 5, 0, 5),
                    child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(product.userName,style: TextStyle(color: Colors.black,fontSize: 13),),
                      Text(product.zhima,style: TextStyle(color: Colors.tealAccent[400],fontSize: 12),),

                    ],

                  ),
                  )
                ],
                ),
              ),

            )

      ],
    ),
  );

}


