import 'package:demo_test/bean/standbyBean.dart';
import 'package:demo_test/util/utils.dart';
import 'package:demo_test/view/baseTitleBar.dart';
import 'package:demo_test/view/baseViewBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StandbyPage extends StatefulWidget {
  StandbyBean standbyBean;
  String titleText;
  String netUrl;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return WebPageState();
  }
}

class WebPageState extends State<StandbyPage> {
  @override
  Widget build(BuildContext context) {
    StandbyBean standbyBean = ModalRoute.of(context).settings.arguments;
    String titleText = standbyBean.title;
    String netUrl = standbyBean.url;
    if (!standbyBean.url.startsWith("http://")) {
      netUrl = "http://" + standbyBean.url;
    }
    print("页面地址" + netUrl);
    return new WebviewScaffold(
      url: netUrl,
      // 登录的URL
//      appBar: new AppBar(
//        leading: IconButton(
//            icon: Icon(
//              Icons.arrow_back,
//              color: Colors.white,
//            ),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//        title: Text(
//          _title,
//          style: TextStyle(fontSize: 16.0),
//          maxLines: 1,
//          overflow: TextOverflow.ellipsis,
//        ),
//          ),
      appBar: BaseViewBar(
        childView: BaseTitleBar(
          titleText,
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
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
