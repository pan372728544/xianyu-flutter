import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'tabbar/Tabs.dart';
import 'router/Routes.dart';
import 'home/fourthfloor/CommendProvider.dart';
import './home/fifthfloor/ProductProvide.dart';

void main() {

  final provideers = Providers()
      ..provide(Provider.function((context)=> CommendProvider(0)))
      ..provide(Provider.function((context)=> ProductProvide()));
      runApp(
        ProviderNode(
          providers: provideers,
          child: MyApp(),
        )
      );

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // 不显示debug
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      home: Tabs(),
      // 路由初始化值
      initialRoute: "/",
      // 路由
      onGenerateRoute: onGenerateRoute,
    );
  }
}

