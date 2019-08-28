import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class Deatails extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
  // TODO: implement build
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("详情页面"),
//        leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//      ),
//
//      body: Text("详情页面"),
//    );
  @override
  Widget build(BuildContext context) {
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      "详情页面",
      style: new TextStyle(color: Colors.white),
    ));
    titleContent.add(new Container(width: 50.0));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebviewScaffold(
//      url: "https://blog.csdn.net/dickyqie",
      url: "https://flutter.dev/docs/development/tools/hot-reload",
//      url: "http://t.channel.45xie.com/manhua/home.html?appid=E9121AF6F5633600943AA69DB667CFB9",
//      url: "http://letupower.com",
      // 登录的URL
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
    ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
