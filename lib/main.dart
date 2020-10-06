import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutterclass_demo/List/whatsapp.dart';
import 'package:flutterclass_demo/Animation/animation1.dart';

import 'Flutter_Linux_Integration/demo1.dart';

void main() {
  runApp(BizApp());
}

class BizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.indigo[800]);
    return MyAnimation();
  }
}