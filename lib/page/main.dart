import 'package:demo_test/page/details.dart';
import 'package:demo_test/page/listpage.dart';
import 'package:demo_test/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MaterialApp(
    initialRoute: '/',
    routes: <String, WidgetBuilder> {
      // When we navigate to the "/" route, build the FirstScreen Widget
      '/': (context) => Homepage(),
      // When we navigate to the "/second" route, build the SecondScreen Widget
      '/listpage': (BuildContext context) => ListPage(),
      '/details': (BuildContext context) => Deatails(),
    },
  ));
}

const listpage = "/listpage";
const details = "/details";

class Homepage extends StatelessWidget {
//  final List<String> items;

//  Homepage({Key key, @required this.items}) : super(key: key);
  List<String> items = ["H5链接数", "H5小说", "H5美图", "H5视频", "H5聚合", "H5菜谱", "H5漫画", "H5图文"];

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
          children: <Widget>[
            Text("测试H5demo")
          ],
        ),
      ),
      body: buildListView(),
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
                  return;
                }
                print(items[index]);
                MyToastUtils(items[index] + "被点击");
                Navigator.pushNamed(context, listpage);
              },
            ),
          );
        });
  }
}
