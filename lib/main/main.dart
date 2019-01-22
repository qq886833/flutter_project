import 'package:flutter/material.dart';
import 'package:flutter_app/main/MainDart.dart';
void main() => runApp(
 //   MyApp()
    MainDart()
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //设置主题
      theme: ThemeData(accentColor: Colors.black, primaryColor: const Color(0xFFDE4435)),
      //设置home
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('欢迎来到App'),
        ),
        body: new Center(
          child: new Text('Hello World 你好世界'),
        ),
      ),
    );
  }
}
