import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PostPage extends StatefulWidget {
  PostPage({Key key}) : super(key: key);

  _PostPageState createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  ScrollController _controller = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener((){
      print("监听到滑动： ${_controller.offset}");
      }
    );


  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Text("data")
    );
  }
}


