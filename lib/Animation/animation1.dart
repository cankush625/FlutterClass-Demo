import 'package:flutter/material.dart';

class MyAnimation extends StatefulWidget {
//  Animation({ Key key, this.duration }) : super(key: key);

  @override
  MyAnimationState createState() => MyAnimationState();
}

class MyAnimationState extends State<MyAnimation> with SingleTickerProviderStateMixin {
  AnimationController _controller;
  var animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this, // the SingleTickerProviderStateMixin
      duration: Duration(seconds: 2),
    );

    animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    )
      ..addListener(() {
        setState(() {
          print(animation.value);
        });
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "My Animation",
          ),
        ),
        body: Column(
          children: <Widget>[
            Container(
              color: Colors.red,
              child: Text(
                "Hello",
                style: TextStyle(
                  fontSize: 96.0 * animation.value,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
