import 'package:flutter/material.dart';

import '../home/HomePage.dart';

import '../fish/FishpondPage.dart';

import '../post/PostPage.dart';

import '../message/MessagePage.dart';

import '../me/MePage.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
/// 底部tabbar
class Tabs extends StatefulWidget {
  Tabs({Key key}) : super(key: key);
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {

  /// 当前选中的索引
  var _currentIndex = 0;

  /// 页面数组
  List _pageList = [

    HomePage(),
    FishpondPage(),
    PostPage(),
    MessagePage(),
    MePage()
  ];


  @override
  Widget build(BuildContext context) {

  // 设置为2倍图 iphone6
  ScreenUtil.instance = ScreenUtil(width: 750,height: 1334)..init(context);

    return Scaffold(

      floatingActionButton: Container(
          height: 70,
          width: 70,
          padding: EdgeInsets.all(8),
          margin: EdgeInsets.only(top: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.white,
          ),
          
          child: FloatingActionButton(
            child: Icon(
              Icons.add,
              size: 30,
              color: Colors.black,
            ),
            onPressed: (){
               setState(() { 
                    this._currentIndex = 2 ;
                });

            },
            backgroundColor: Colors.yellow,
          ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: this._pageList[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index){
          setState(() {
            this._currentIndex = index;
          });
        },
        fixedColor: Colors.yellow,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
             icon: Image.asset(
               "images/home_normal.png",
               fit: BoxFit.cover,
               width: 30,
                    
             ),
             activeIcon: Image.asset(
               "images/home_highlight.png",
               fit: BoxFit.cover,
               width: 30,),
            title: Text("闲鱼",
              style: TextStyle(
               color: Colors.black
              ),)
           ),
           BottomNavigationBarItem(
             icon: Image.asset(
               "images/fishpond_normal.png",
               fit: BoxFit.cover,
               width: 30,
                    
             ),
             activeIcon: Image.asset(
               "images/fishpond_highlight.png",
               fit: BoxFit.cover,
               width: 30,),
            title: Text("鱼塘",
              style: TextStyle(
               color: Colors.black
              ),),
           ),
           BottomNavigationBarItem(
             icon: Image.asset(
               "images/post_normal.png",
               fit: BoxFit.cover,
               width: 30,    
             ),
            title: Text(
              "发布",
              style: TextStyle(
               color: Colors.black
              ),
              )
           ),
            BottomNavigationBarItem(
             icon: Image.asset(
               "images/message_normal.png",
               fit: BoxFit.cover,
               width: 30,
                    
             ),
             activeIcon: Image.asset(
               "images/message_highlight.png",
               fit: BoxFit.cover,
               width: 30,),
            title: Text("我的",
              style: TextStyle(
               color: Colors.black
              ),)
           ),
           BottomNavigationBarItem(
             icon: Image.asset(
               "images/account_normal.png",
               fit: BoxFit.cover,
               width: 30,
                    
             ),
             activeIcon: Image.asset(
               "images/account_highlight.png",
               fit: BoxFit.cover,
               width: 30,),
            title: Text("我的",
              style: TextStyle(
               color: Colors.black
              ),)
           ),
        ],
      ),


    );
  }
}
