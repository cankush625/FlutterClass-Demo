import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class BizCard extends StatelessWidget {
  Widget build(BuildContext context) {
    double width = 340;
    double height = 230;
    var phoneIcon = Icon(Icons.phone);
    var mailIcon = Icon(Icons.email);
    var bizcardAppBar = AppBar(
      title: Text('BizCard'),
      backgroundColor: Colors.purple,
      actions: <Widget>[
        IconButton(icon: phoneIcon, onPressed: makeCall,),
        IconButton(icon: mailIcon, onPressed: sendMail,),
      ],
    );
    var textStyle = TextStyle(
      fontSize: 20,
    );
    var name = Row(
      children: <Widget>[
        Icon(Icons.person),
        SizedBox(width: 15),
        Text(
          'Ankush Chavan',
          style: textStyle,
        ),
        SizedBox(height: 30,),
      ],
    );
    var email = Row(
      children: <Widget>[
        Icon(Icons.email),
        SizedBox(width: 15),
        Text(
          'cankush625@gmail.com',
          style: textStyle,
        ),
        SizedBox(height: 30,),
      ],
    );
    var phoneNumber = Row(
      children: <Widget>[
        Icon(Icons.phone),
        SizedBox(width: 15),
        Text(
          '3448932',
          style: textStyle,
        ),
      ],
    );
    var contactInfo = Container(
      alignment: Alignment.centerLeft,
      margin: EdgeInsets.only(top: (width * 0.3)/2),
      padding: EdgeInsets.only(left: 40, top: 70),
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.yellowAccent,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: <Widget>[
          name,
          email,
          phoneNumber,
        ],
      ),
    );
    var profilePicture = Container(
      margin: EdgeInsets.only(left: (width * 0.5) - ((width * 0.3)/2)),
      width: width * 0.3,
      height: width * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular((width * 3)/2),
        border: Border.all(
          color: Colors.amber,
          width: 3,
        ),
        image: DecorationImage(
          image: NetworkImage(
            'https://avatars1.githubusercontent.com/u/41515472?s=460&u=2e83d208268b51f32d5212de73328a501ecd4ce5&v=4',
          ),
          fit: BoxFit.cover,
        ),
        color: Colors.orange,
      ),
    );
    var bizcardHome = Scaffold(
      appBar: bizcardAppBar,
      body: SafeArea(
        child: Center(
          child: Stack(
            children: <Widget>[
              contactInfo,
              profilePicture,
            ],
          ),
        ),
      ),
    );
    Widget materialApp = MaterialApp(
      home: bizcardHome,
      debugShowCheckedModeBanner: false,
    );
    return materialApp;
  }

  void makeCall() {
    print("Calling Ankush");
    Fluttertoast.showToast(
      msg: "Calling Ankush",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.green[600],
      textColor: Colors.grey[800],
      fontSize: 16.0,
    );
  }
  void sendMail() {
    print("Sending a mail to Ankush");
    Fluttertoast.showToast(
      msg: "Sending mail",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red[600],
      textColor: Colors.grey[800],
      fontSize: 16.0,
    );
  }
}