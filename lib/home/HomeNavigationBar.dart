import 'package:flutter/material.dart';
import 'package:xianyu/home/HomeScanPage.dart';

class HomeAppBar {
  BuildContext context;
  HomeAppBar(this.context);
  // 获取AppBar
   AppBar getHomeAppBar(){
    return AppBar(
        title: Container(
          margin: EdgeInsets.fromLTRB(0, 10, 0, 10),
            child: TextField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(top: 10),
                hintText: "现代轻奢沙发",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white
              ),
            ),
        ),
        leading: IconButton(
            icon:  Image.asset("images/home_logo_title_xianyu.png"),
            iconSize: 30,
            onPressed: (){
              print("object");
            },
          ),
        actions: <Widget>[
          IconButton(
            icon:  Image.asset("images/home_bar_scan.png"),
            iconSize: 30,
            onPressed: (){

           Navigator.pushNamed(context, '/homescan',arguments: { "pageName":"扫一扫啊","pageContent":"这是传递过来的参数"});
            },
          )
        ],
      );
  }

}