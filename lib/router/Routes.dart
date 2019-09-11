import 'package:flutter/material.dart';
import '../tabbar/Tabs.dart';
import '../home/HomeScanPage.dart';

final routes = {
  '/' : (context) => Tabs(),
  '/homescan' : (context,{arguments}) => HomeScanPage(arguments: arguments,),
   

};

var onGenerateRoute = (RouteSettings settings) {

  final String name = settings.name;
  final Function pageConentBuilder = routes[name];
  if (pageConentBuilder != null){
    if (settings.arguments != null) {
      final Route route = MaterialPageRoute(
        builder: (context) => 
        pageConentBuilder(context,arguments: settings.arguments)

      );
      return route;
    } else {
      final Route route = MaterialPageRoute(
        builder: (context) => pageConentBuilder(context)
      );
      return route;
    }

  }


};