import 'package:demo_test/bean/detailsBean.dart';
import 'package:demo_test/util/utils.dart';
import 'package:demo_test/view/baseTitleBar.dart';
import 'package:demo_test/view/baseViewBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class DeatailsPage extends StatefulWidget {
  DetailsBean deatailsBean;
  String netUrl;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebPageState();
  }
}

class WebPageState extends State<DeatailsPage> {
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
    DetailsBean deatailsBean = ModalRoute.of(context).settings.arguments;
    String netUrl;
    if (!deatailsBean.details['url'].startsWith("http")) {
      netUrl = "http://" + deatailsBean.details['url'];
    }
//    _url = "https://juejin.im/post/5c452bac6fb9a049af6d919a#heading-3";
    print("页面地址：" + netUrl);
//    List<Widget> titleContent = [];
//    titleContent.add(new Text(
////      "详情页面",
//      deatailsBean.title,
//      style: new TextStyle(color: Colors.white),
//    ));
//    titleContent.add(new Container(width: 50.0));
    // WebviewScaffold是插件提供的组件，用于在页面上显示一个WebView并加载URL
    return new WebviewScaffold(
//      url: "https://blog.csdn.net/dickyqie",
//      url: "https://flutter.dev/docs/development/tools/hot-reload",
//      url: "http://t.channel.45xie.com/manhua/home.html?appid=E9121AF6F5633600943AA69DB667CFB9",
//      url: "http://letupower.com",
      url: netUrl,
      // 登录的URL
//      appBar: new AppBar(
//        title: new Row(
//          mainAxisAlignment: MainAxisAlignment.center,
//          children: titleContent,
//        ),
//        iconTheme: new IconThemeData(color: Colors.white),
//      ),

      appBar: BaseViewBar(
        childView: BaseTitleBar(
          deatailsBean.title,
          leftIcon: Icons.arrow_back,
          rightText: "刷新",
          rightClick: () {
            MyToastUtils("刷新页面");
            setState(() {
              FlutterWebviewPlugin().reload();
            });
          },
        ),
        preferredSize: Size.fromHeight(50.0),
      ),
      withZoom: true,
      // 允许网
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
