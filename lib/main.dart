import 'dart:convert';

import 'package:demo_test/bean/pageBean.dart';
import 'package:demo_test/bean/standbyBean.dart';
import 'package:demo_test/net/httpApi.dart';
import 'package:demo_test/page/details.dart';
import 'package:demo_test/page/listpage.dart';
import 'package:demo_test/page/standby.dart';
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
      '/': (context) => Homepage(),
      // When we navigate to the "/second" route, build the SecondScreen Widget
      '/listpage': (BuildContext context) => ListPage(),
      '/details': (BuildContext context) => Deatails(),
      '/standby': (BuildContext context) => Standby(),
    },
  ));
}

const listpage = "/listpage";
const details = "/details";
const standby = "/standby";

List<dynamic> ReadList = new List(); //小说
List<dynamic> PicList = new List(); //美图
List<dynamic> AggList = new List(); //聚合
List<dynamic> VideoList = new List(); //视频
List<dynamic> CartoonList = new List(); //漫画
List<dynamic> CookbookList = new List(); //菜谱
List<dynamic> ImageTextList = new List(); //图文
List<dynamic> StandbyList = new List(); //备用

class Homepage extends StatelessWidget {
//  final List<String> items;

//  Homepage({Key key, @required this.items}) : super(key: key);
  List<String> items = [
    "H5链接数",
    "H5小说",
    "H5美图",
    "H5视频",
    "H5聚合",
    "H5漫画",
    "H5菜谱",
    "H5图文",
    "H5备用"
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
//    return MaterialApp(
//      title: "demo",
//      home: buildScaffold(),
//    );
    return new Scaffold(
      appBar: AppBar(
//        title: Text("测试H5demo",),
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("测试H5demo")],
        ),
      ),
      body: buildListView(),
    );
  }

  /**
   * 请求数据
   */
  void getData() {
//    RequestMap.requestGetData(this).listen((da) {
//      print(da.toString());
//      setUrlList(da);
//    }, onError: (err) {
//      log("errrr----");
//      print("errrr"+err);
//      MyToastUtils(err);
//    });

    HttpApi.instance.getData(
      success: (data) {
        final body = json.decode(data.toString());
        final urlData = body["data"];

        print("one_two" + urlData.toString());

        setUrlList(urlData);
      },
      error: (msg) {
        print("errer" + msg);
        MyToastUtils(msg);
      },
    );
  }

  Scaffold buildScaffold() {
    return new Scaffold(
      appBar: AppBar(
        title: Text("测试H5demo"),
      ),
      body: buildListView(),
    );
  }

  ListView buildListView() {
    return ListView.builder(
        itemExtent: 70.0,
        itemCount: items.length,
        itemBuilder: (context, index) {
          return new ListTile(
            title: GestureDetector(
              child: new Text(items[index],
                  textAlign: TextAlign.center,
                  style:
                      TextStyle(fontSize: 18.0, fontStyle: FontStyle.italic)),
              onTap: () {
                if (items[index].contains("H5链接数")) {
                  MyToastUtils(items[index]);
                  if (ReadList.length != 0 ||
                      PicList.length != 0 ||
                      AggList.length != 0 ||
                      VideoList.length != 0 ||
                      CartoonList.length != 0 ||
                      CookbookList.length != 0 ||
                      ImageTextList.length != 0) {
                    //如果集合中有数据了，直接返回，不再请求
                    printListCount();
                    return;
                  }
                  getData();
                  return;
                }
                print(items[index]);
                MyToastUtils(items[index] + "被点击");
                switch (index) {
                  case 0:
//                    MyToastUtils(items[index]);
                    //进不来这里，被上面的拦截了
                    break;
                  case 1:
                    lunchList(context, index, "小说列表页面", ReadList);
                    break;
                  case 2:
                    lunchList(context, index, "美图列表页面", PicList);
                    break;
                  case 3:
                    lunchList(context, index, "视频列表页面", VideoList);
                    break;
                  case 4:
                    lunchList(context, index, "聚合列表页面", AggList);
                    break;
                  case 5:
                    lunchList(context, index, "漫画列表页面", CartoonList);
                    break;
                  case 6:
                    lunchList(context, index, "菜谱列表页面", CookbookList);
                    break;
                  case 7:
                    lunchList(context, index, "图文列表页面", ImageTextList);
                    break;
                  case 8:
                    Navigator.pushNamed(context, standby,
                        arguments: StandbyBean("备用代码",
                            "http://t.alpha.channel.45xie.com/ad.html"));
                    break;
                }
              },
            ),
          );
        });
  }

  /**
   * 跳转界面
   */
  void lunchList(context, index, title, list) {
    if (list != null && list.length != 0) {
    } else {
      MyToastUtils("请先点击H5链接数获取数据");
      return;
    }
    MyToastUtils(items[index]);
//    Navigator.pushNamed(context, listpage,
//        arguments: {"title": title, "list": list});
    Navigator.pushNamed(context, listpage, arguments: PageBean(title, list));
//    switch (index) {
//      case 0:
//        break;
//      case 1:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 2:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 3:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 4:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 5:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 6:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 7:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//      case 9:
//        Navigator.pushNamed(context, listpage,
//            arguments: {"title": title, "list": list});
//        break;
//    }
  }

  /**
   * 设置集合数据
   */
  void setUrlList(urlData) {
    print("跑到设置方法了");

    if (urlData != null && urlData.length > 0) {
      for (var value in urlData) {
        var type = value['type'];
//        print(value['uv']);
//        String uv = value['uv'].toString();
////
//        if (int.parse(uv) < 100) {
//          //链接访问数小于100不统计
//          break;
//        }
        switch (type) {
          case 1:
            ReadList.add(value);
            break;
          case 2:
            AggList.add(value);
            break;
          case 3:
            PicList.add(value);
            break;
          case 4:
            VideoList.add(value);
            break;
          case 5:
            CartoonList.add(value);
            break;
          case 6:
            CookbookList.add(value);
            break;
          case 7:
            ImageTextList.add(value);
            break;
        }
      }
    }
//    sortList(ReadList);
//    sortList(AggList);
//    sortList(PicList);
//    sortList(VideoList);
//    sortList(CartoonList);
//    sortList(CookbookList);
//    sortList(ImageTextList);
    printListCount();
  }

  void sortList(list) {
    print("排序");
    list.sort((a, b) =>
        int.parse(a['uv'].toString()).compareTo(int.parse(b['uv'].toString())));
    log.info(ReadList.toString());
  }

  void printListCount() {
    print("分割线");
    print(ReadList.length);
    print(AggList.length);
    print(PicList.length);
    print(VideoList.length);
    print(CartoonList.length);
    print(CookbookList.length);
    print(ImageTextList.length);
  }
}
