import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class HomeFifthContent extends StatefulWidget {
  HomeFifthContent({Key key,this.index}) : super(key: key);
  final int index;
  // final ScrollController scrollController;
  _HomeFifthContentState createState() => _HomeFifthContentState();
}

class _HomeFifthContentState extends State<HomeFifthContent> {
  @override
  Widget build(BuildContext context) {

    return  ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      // controller: widget.scrollController,
      itemCount: 20,
      itemBuilder: (context,index){

        return Container(
          height: 100,
          color: Colors.red,
          child: Text("data---$index"),
        );
      },

  
    );
  }
}


// StaggeredGridView.countBuilder(
//       // controller: widget.scrollController,
//               crossAxisCount: 4,
//               shrinkWrap: false,
//               // physics: NeverScrollableScrollPhysics(),
//               itemCount: 18,
//               itemBuilder: (BuildContext context, int index) => new Container(
//                   color: Colors.green,
//                   child: new Center(
//                     child: new CircleAvatar(
//                       backgroundColor: Colors.white,
//                       child: new Text('$index'),
//                     ),
//                   )),
//               staggeredTileBuilder: (int index) =>
//                   new StaggeredTile.count(2, index.isEven ? 2 : 1),
//               mainAxisSpacing: 4.0,
//               crossAxisSpacing: 4.0,
//             );