import 'package:flutter/material.dart';

class Deatails extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("详情"),
          leading: Icon(Icons.arrow_back),
        ),
        body: Text("详情"),
      ),
    );
  }
}
