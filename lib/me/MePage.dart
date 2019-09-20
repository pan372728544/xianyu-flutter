import 'package:flutter/material.dart';

class MePage extends StatefulWidget {
  MePage({Key key}) : super(key: key);

  _MePageState createState() => _MePageState();
}

class _MePageState extends State<MePage> {
   PageController _pageController;

   @override
   void initState() {
     super.initState();
     _pageController = PageController();
   }

   @override
   void dispose() {
     _pageController.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {
     return MaterialApp(
       home: Scaffold(
         body: PageView(
           controller: _pageController,
           children: [
             Container(
               color: Colors.red,
               child: Center(
                 child: RaisedButton(
                   color: Colors.white,
                   onPressed: () {
                     if (_pageController.hasClients) {
                       _pageController.animateToPage(
                         1,
                         duration: const Duration(milliseconds: 400),
                         curve: Curves.easeInOut,
                       );
                     }
                   },
                   child: Text('Next'),
                 ),
               ),
             ),
             Container(
               color: Colors.blue,
               child: Center(
                 child: RaisedButton(
                   color: Colors.white,
                   onPressed: () {
                     if (_pageController.hasClients) {
                       _pageController.animateToPage(
                         0,
                         duration: const Duration(milliseconds: 400),
                         curve: Curves.easeInOut,
                       );
                     }
                   },
                   child: Text('Previous'),
                 ),
               ),
             ),
           ],
         ),
       ),
     );
   }
}