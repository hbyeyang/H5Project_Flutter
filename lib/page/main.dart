import 'package:demo_test/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(new MyApp(
    items: ["H5链接数", "H5小说", "H5美图", "H5视频", "H5聚合", "H5菜谱", "H5漫画", "H5图文"],
//    items: ["H5链接数", "H5小说", "H5美图", "H5视频", "H5聚合", "H5菜谱", "H5漫画", "H5图文","H5链接数", "H5小说", "H5美图", "H5视频", "H5聚合", "H5菜谱", "H5漫画", "H5图文"],
  ));
}

class MyApp extends StatelessWidget {
  final List<String> items;

  MyApp({Key key, @required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      title: "demo",
      home: buildScaffold(),
    );
  }

  Scaffold buildScaffold() {
    return new Scaffold(
      appBar: AppBar(
        title: Text("测试demo"),
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
                Navigator.pushNamed(context, '/listpage');
                print(items[index]);
                MyToastUtils(items[index] + "被点击");
              },
            ),
          );
        });
  }
}
