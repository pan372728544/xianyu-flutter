import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:async';
// http 请求
import 'package:dio/dio.dart';

// 服务地址配置
import '../config/ServiceUrl.dart';
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
            height: 400,
            decoration: BoxDecoration(
              color: Color.fromRGBO(237, 237, 237, 1),
            ),
            child: Stack(
              children: <Widget>[
                Container(
                  height: 255,
                   decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                    ),
                ),

                Positioned(
                  child: Container(
                  // 设置高度
                  height: 180,
                  // 父视图间距
                  margin: EdgeInsets.all(10),
                  // 装饰
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white),
                  child: Stack(
                    children: <Widget>[
                      GridView.count(
                          physics: NeverScrollableScrollPhysics(),
                          crossAxisCount: 5,
                          crossAxisSpacing: 0,
                          mainAxisSpacing: 5,
                          padding: EdgeInsets.only(top: 10),
                          children: categoryList.map((item) {
                            return _gridViewItem(context, item);
                          }).toList()),
                    ],
                  ),
                )
                ),
                Positioned(

                 child: Container(
                   
                    height: 210,
                    margin: EdgeInsets.only(top:200,left: 10,right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                    ),
                    child: HomeStar(),  
                  )
                ),

               
              ],
            ),
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
    return InkWell(
      onTap: () {
        /// 点击对应的item
        print(item['title']);
      },
      child: Column(
        children: <Widget>[
          // 图片数据
          Image.network(
            item['imageUrl'],
            width: 60,
            fit: BoxFit.fill,
          ),
          // 标题
          Text(
            item['title'],
            style: TextStyle(fontSize: 12.0, color: Colors.black),
          )
        ],
      ),
    );
  }
}
