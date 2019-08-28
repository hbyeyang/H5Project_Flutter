import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

MyToastUtils(String message) {
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
//      backgroundColor: Colors.white,
      textColor: Colors.blueAccent);
}
