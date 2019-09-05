import 'dart:convert';

import 'package:demo_test/bean/homePageBean.dart';
import 'package:demo_test/net/httpApi.dart';
import 'package:demo_test/page/detailsPage.dart';
import 'package:demo_test/page/homePage.dart';
import 'package:demo_test/page/listPage.dart';
import 'package:demo_test/page/standbyPage.dart';
import 'package:demo_test/util/loghelper.dart';
import 'package:demo_test/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

var log = LogHelper();

void main() {
//void main() async {
//  await log.connectRemote();
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder>{
      // When we navigate to the "/" route, build the FirstScreen Widget
      '/': (context) => MainPage(),
      // When we navigate to the "/second" route, build the SecondScreen Widget
      '/homePage': (BuildContext context) => HomePage(),
      '/listPage': (BuildContext context) => ListPage(),
      '/detailsPage': (BuildContext context) => DeatailsPage(),
      '/standbyPage': (BuildContext context) => StandbyPage(),
    },
  ));
}

const homePage = "/homePage";
const listPage = "/listPage";
const detailsPage = "/detailsPage";
const standbyPage = "/standbyPage";

bool isLoadHomePage = false;

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: AppBar(
//        title: Text("测试H5demo",),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("测试H5demo")],
        ),
      ),
//      body: GestureDetector(
//        child: Container(
//          child: Text(
//            "获取数据",
//            style: TextStyle(
//                fontSize: 18.0,
//                color: Colors.greenAccent,
//                backgroundColor: Colors.pinkAccent),
//          ),
//          alignment: Alignment.center,
//        ),
//        onTap: () {
//          getData(context);
//        },
//      ),
      body: Container(
        child: RaisedButton(
            child: Text("获取数据"),
            color: Colors.greenAccent,
            onPressed: () {
              getData(context);
            }),
        alignment: Alignment.center,
      ),
    );
  }

  /**
   * 请求数据
   */
  void getData(BuildContext context) {
    print("准备请求数据=_=");

    HttpApi.instance.getData(
      success: (data) {
        final body = json.decode(data.toString());
        final urlData = body["data"];
        print("one_two" + urlData.toString());
//        setUrlList(urlData);
        Navigator.pushNamed(context, homePage,
            arguments: HomePageBean(urlData));
      },
      error: (msg) {
        print("errer" + msg);
        MyToastUtils(msg);
      },
    );
  }
}
