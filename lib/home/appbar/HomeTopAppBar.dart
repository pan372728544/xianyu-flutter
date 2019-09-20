import 'package:flutter/material.dart';

 class HomeTopAppBar extends StatelessWidget {
   const HomeTopAppBar({Key key}) : super(key: key);
   @override
   Widget build(BuildContext context) {
      return SliverAppBar(
        // 导航条不跟随移动
        pinned: true,
        // 导航条底部阴影
        elevation: 0,
        backgroundColor: Colors.yellow,
        leading: IconButton(
                icon:  Image.asset("images/home_logo_title_xianyu.png"),
                iconSize: 30,
                onPressed: (){
                  print("object");
                },
          ),
        centerTitle: true,
        title: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 40,
          ),
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

