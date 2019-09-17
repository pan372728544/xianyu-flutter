import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text("发布"),
      ),
      body: Container(
        color: Colors.red,
        // width: ScreenUtil.screenWidthDp,
        // height: ScreenUtil.getInstance().setHeight(100),
        width: ScreenUtil.getInstance().setWidth(749),
           height: ScreenUtil.getInstance().setWidth(750),
          child: Text("data"),


      ),

    );
  }
}