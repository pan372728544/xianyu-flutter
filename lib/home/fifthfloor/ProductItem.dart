class ProductItem {
  String totalPage;
  List<Product> product;

  ProductItem({this.totalPage, this.product});

  ProductItem.fromJson(Map<String, dynamic> json) {
    totalPage = json['totalPage'];
    if (json['product'] != null) {
      product = new List<Product>();
      json['product'].forEach((v) {
        product.add(new Product.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['totalPage'] = this.totalPage;
    if (this.product != null) {
      data['product'] = this.product.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Product {
  String key;
  String productUrl;
  String productTitle;
  String price;
  String count;
  String userUrl;
  String userName;
  String zhima;

  Product(
      {this.key,
      this.productUrl,
      this.productTitle,
      this.price,
      this.count,
      this.userUrl,
      this.userName,
      this.zhima});

  Product.fromJson(Map<String, dynamic> json) {
    key = json['key'];
    productUrl = json['productUrl'];
    productTitle = json['productTitle'];
    price = json['price'];
    count = json['count'];
    userUrl = json['userUrl'];
    userName = json['userName'];
    zhima = json['zhima'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['key'] = this.key;
    data['productUrl'] = this.productUrl;
    data['productTitle'] = this.productTitle;
    data['price'] = this.price;
    data['count'] = this.count;
    data['userUrl'] = this.userUrl;
    data['userName'] = this.userName;
    data['zhima'] = this.zhima;
    return data;
  }
}