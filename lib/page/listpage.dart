import 'package:demo_test/page/main.dart';
import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    List<Widget> titleContent = [];
    titleContent.add(new Text(
      "列表页面",
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
            Navigator.pushNamed(context, details);
          },
        ),
      ),
    );
  }
}
