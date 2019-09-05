import 'package:demo_test/bean/detailsBean.dart';
import 'package:demo_test/bean/pageBean.dart';
import 'package:demo_test/main.dart';
import 'package:demo_test/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';

class ListPage extends StatelessWidget {
//  final String title;
//  final List<dynamic> dataLists;
  PageBean pageBean;

  ListPage({
    Key key,
    @required this.pageBean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    pageBean = ModalRoute.of(context).settings.arguments;
    print(pageBean.dataLists.length);
    // TODO: implement build
    List<Widget> titleContent = [];
    titleContent.add(new Text(
//      "列表页面",
      pageBean.title,
      style: new TextStyle(color: Colors.white),
    ));
    titleContent.add(new Container(width: 50.0));
    return Scaffold(
//      appBar: AppBar(
//        title: Text("列表页面",
//        textAlign: TextAlign.center,),
////        leading: Icon(Icons.arrow_back),
//        leading: IconButton(
//            icon: Icon(Icons.arrow_back),
//            onPressed: () {
//              Navigator.pop(context);
//            }),
//      ),
      appBar: new AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: titleContent,
        ),
        iconTheme: new IconThemeData(color: Colors.white),
      ),
//      body: Text("列表页面"),
//      body: Container(
//        alignment: Alignment.center,
//        child: GestureDetector(
//          child: Text("列表页面"),
//          onTap: () {
//            print("列表详情");
//            if (pageBean != null && pageBean.dataLists != null) {
//              print(pageBean.dataLists.length);
//            }
//            Navigator.pushNamed(context, details);
//          },
//        ),
//      ),
      body: new ListView.builder(
          itemExtent: 150.0,
          itemCount: pageBean.dataLists.length,
          itemBuilder: buildItem),
    );
  }

  //ListView的Item 一个有点击事件的Text控件
  Widget buildItem(BuildContext context, int index) {
    var _url = pageBean.dataLists[index]['url'];
    if (!_url.startsWith("http")) {
      _url = "http://" + _url;
    }
    //设置分割线
//    if (index.isOdd) return new Divider();
    //设置字体样式
    TextStyle textStyle = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 17.0, color: Colors.redAccent);
    TextStyle textStyle1 = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.blue);
    TextStyle textStyle2 = new TextStyle(
        fontWeight: FontWeight.bold, fontSize: 14.0, color: Colors.greenAccent);
    return new GestureDetector(
      onTap: () {
        //处理点击事件
        lunchList(context, pageBean.dataLists[index]["name"],
            pageBean.dataLists[index]);
      },
      child: new Container(
        alignment: Alignment.center,
        color: Colors.white70,
//        padding: const EdgeInsets.all(8.0),
//        child: new Text(pageBean.dataLists[index]['name'], style: textStyle),
        child: new Column(
          children: <Widget>[
            Text("编号：" + index.toString()),
            Text("名称：" + pageBean.dataLists[index]['name'],
                overflow: TextOverflow.ellipsis, style: textStyle),
            Text(
              "地址：" + pageBean.dataLists[index]['url'],
              overflow: TextOverflow.ellipsis,
              style: textStyle1,
              textAlign: TextAlign.center,
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: Text(
                    "UV：" + pageBean.dataLists[index]['uv'].toString(),
                    textAlign: TextAlign.center,
                    style: textStyle2,
                  ),
                ),
                Expanded(
                  child: Text(
                    "PV：" + pageBean.dataLists[index]['pv'].toString(),
                    textAlign: TextAlign.center,
                    style: textStyle2,
                  ),
                ),
              ],
            ),
            new Row(
              children: <Widget>[
                Expanded(
                  child: RaisedButton(
                    child: Text("外跳"),
                    onPressed: () {
                      _launchURL(_url);
                    },
                    splashColor: Colors.amberAccent,
                    color: Colors.greenAccent,
                    elevation: 0.0,
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("复制"),
                    onPressed: () {
                      Clipboard.setData(ClipboardData(text: _url));
                      MyToastUtils("已复制链接到剪切板");
                    },
                    splashColor: Colors.white,
                    color: Colors.pinkAccent,
                    elevation: 0.0,
                  ),
                ),
                Expanded(
                  child: RaisedButton(
                    child: Text("内跳"),
                    onPressed: () {
                      lunchList(context, pageBean.dataLists[index]["name"],
                          pageBean.dataLists[index]);
                    },
                    splashColor: Colors.greenAccent,
                    color: Colors.amberAccent,
                    elevation: 0.0,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  _launchURL(url) async {
    print("跳转地址：" + url);
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /**
   * 跳转界面
   */
  void lunchList(context, title, dynamic) {
    if (dynamic == null) {
      MyToastUtils("内容为空，请返回重试");
    }
    MyToastUtils(dynamic['name']);
    Navigator.pushNamed(context, detailsPage,
        arguments: DetailsBean(title, dynamic));
  }
}
