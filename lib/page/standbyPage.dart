import 'package:demo_test/bean/standbyBean.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';

class StandbyPage extends StatelessWidget {
  StandbyBean _standbyBean;
  String _title;
  String _url;
  @override
  Widget build(BuildContext context) {
    _standbyBean = ModalRoute.of(context).settings.arguments;
    _title = _standbyBean.title;
    _url = _standbyBean.url;
    if (!_standbyBean.url.startsWith("http://")) {
      _url = "http://" + _standbyBean.url;
    }
    print("页面地址" + _url);
    return new WebviewScaffold(
      url: _url,
      // 登录的URL
      appBar: new AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
        title: Text(
          _title,
          style: TextStyle(fontSize: 16.0),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
      withZoom: true,
      // 允许网页缩放
      withLocalStorage: true,
      // 允许LocalStorage
      withJavascript: true, // 允许执行js代码
    );
  }
}
