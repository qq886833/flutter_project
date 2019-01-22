import 'package:flutter/material.dart';
import 'package:flutter_app/res/YYColors.dart';
import 'package:flutter_app/pages/home/HomePage.dart';
import 'package:flutter_app/pages/message/MessagePage.dart';
import 'package:flutter_app/pages/my/MyPage.dart';
import 'package:flutter_app/pages/service/ServicePage.dart';

class MainDart extends StatefulWidget {
  @override
  _MainDartState createState() => _MainDartState();
}

class _MainDartState extends State<MainDart> with TickerProviderStateMixin {
  //
  int positionIndex = 0;
  var mainTitle = ["首页", "消息", "服务", "我的"];
  var indexStack;
  List<BottomNavigationBarItem> navigationViews;
  final navigationKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    initData();
    return MaterialApp(
      navigatorKey: navigationKey,
      debugShowCheckedModeBanner: false,  // 设置这一属性即可

      theme: ThemeData(
          accentColor: Colors.black,
          textSelectionColor: YYColors.colorWhite,
          primaryColor: YYColors.colorPrimary),
      home: Scaffold(
        appBar: AppBar(
          title: new Text(mainTitle[positionIndex],
              style: new TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          centerTitle: true,
          // //这个相当于actionBar上的menu
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.add_a_photo),
                onPressed: () {
                  navigationKey.currentState
                      .push(new MaterialPageRoute(builder: (context) {
                    return null;
                  }));
                }),
            new IconButton(
                icon: new Icon(Icons.search),
                onPressed: () {
                  navigationKey.currentState
                      .push(new MaterialPageRoute(builder: (context) {
                    return null;
                  }));
                })
          ],
        ),
        body: indexStack,

        ////相当于底部导航栏
        bottomNavigationBar: new BottomNavigationBar(
          items: navigationViews
              .map((BottomNavigationBarItem navigationView) => navigationView)
              .toList(),
          currentIndex: positionIndex,
          type: BottomNavigationBarType.fixed,
          fixedColor: Colors.black,
          onTap: (index) {
            setState(() {
              positionIndex = index;
            });
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    navigationViews = <BottomNavigationBarItem>[
      new BottomNavigationBarItem(
        icon: const Icon(Icons.home),
        title: new Text(mainTitle[0]),
        backgroundColor: Colors.white,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.assignment),
        title: new Text(mainTitle[1]),
        backgroundColor: Colors.white,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.devices_other),
        title: new Text(mainTitle[2]),
        backgroundColor: Colors.white,
      ),
      new BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        title: new Text(mainTitle[3]),
        backgroundColor: Colors.white,
      )
    ];
  }

  void initData() {
    indexStack = new IndexedStack(
      children: <Widget>[
        new HomePage(),
        new MessagePage(),
        new ServicePage(),
        new MyPage()
      ],
      index: positionIndex,
    );
  }
}
