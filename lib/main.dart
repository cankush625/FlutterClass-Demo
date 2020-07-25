import 'package:flutter/material.dart';
import 'package:flutterclass_demo/Home/biz_card.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(BizApp());
}

class BizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.indigo[800]);
    return BizCard();
  }
}