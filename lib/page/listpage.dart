import 'package:demo_test/bean/pageBean.dart';
import 'package:demo_test/main.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
//  final String title;
//  final List<dynamic> dataLists;
  final PageBean pageBean;

  ListPage({
    Key key,
    @required this.pageBean,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PageBean pageBean = ModalRoute.of(context).settings.arguments;
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
      body: Container(
        alignment: Alignment.center,
        child: GestureDetector(
          child: Text("列表页面"),
          onTap: () {
            print("列表详情");
            if (pageBean != null && pageBean.dataLists != null) {
              print(pageBean.dataLists.length);
            }
            Navigator.pushNamed(context, details);
          },
        ),
      ),
    );
  }
}
