import 'package:flutter/material.dart';
import '../../config/HttpMethod.dart';
import 'ProductItem.dart';

class ProductProvide with ChangeNotifier {

   // 总页数
   int _totalPage = 0;

   static Product _endProduct = Product(
     key: "end",
     productUrl: "",
     productTitle: "",
     price: "",
     count: "",
     userName: "",
     userUrl: "",
     zhima: ""

   );

   // 商品数组
   List<Product> _products = <Product>[_endProduct];

  
   List<Product> get products =>  _products;
   int get totalPage =>  _totalPage;

  // 获取商品数据  请求页数 请求类型
  Future getProducts(int page,int type) async {

    await getHomeCommendProductData({"page": page,"type": type}).then ((value){


     var productItem = ProductItem.fromJson(value);

     _totalPage = int.parse(productItem.totalPage);


    if (page == 1) {
      // _products.clear();
      _products = <Product>[_endProduct];
    }

    //  _products.addAll(productItem.product);
    _products.insertAll(0, productItem.product);
        print("========================================================getHomeCommendProductData============${_products.length}");
      notifyListeners();

    });

  }


}