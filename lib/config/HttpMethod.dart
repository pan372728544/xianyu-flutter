import 'package:dio/dio.dart';
import 'dart:async';
import 'ServiceUrl.dart';



Future getHomeCategoryData() async {
  return request(homeCategoryUrl);
}

Future getHomeCategoryStarData() async {
  return request(homeCategoryStarUrl);
}

// 公共网络请求
Future request(url) async {

  try{
    print('============开始发送网络请求============');
    Response response;
    Dio dio = new Dio();
    response = await dio.get(url);

    if (response.statusCode == 200){
      print("网络请求成功");
      return response.data;
    } else {
      throw Exception('后端接口出现异常，请检测代码和服务器情况.........');
    }
    
  } catch (e) {
    print('请求失败，失败原因：$e');
  }

}