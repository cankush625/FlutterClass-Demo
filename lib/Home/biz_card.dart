import 'package:flutter/material.dart';

Widget BizCard() {
  var userProfilePicture = Icon(Icons.account_circle);
  var clickableUserProfilePicture = IconButton(
    icon: userProfilePicture,
    onPressed: showUserProfile,
  );
  var bizCardAppBar = AppBar(
    title: Text(
      'SkillCard',
    ),
    actions: <Widget>[
      clickableUserProfilePicture,
    ],
    backgroundColor: Colors.purple,
  );
  var profilePicture = Container(
    child: Padding(
      padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      child: CircleAvatar(
        backgroundImage: NetworkImage(
          'https://avatars1.githubusercontent.com/u/41515472?s=460&u=2e83d208268b51f32d5212de73328a501ecd4ce5&v=4'
        ),
        radius: 35,
      ),
    ),
  );
  var cardBackgroundColor = Colors.orange[400];
  var bizCardShadow = BoxShadow(
    color: Colors.grey,
    blurRadius: 15,
  );
  var bizCardTextStyle = TextStyle(
    fontSize: 20,
  );
  var bizCardContentPadding = EdgeInsets.fromLTRB(30, 20, 0, 0);
  var myName = Padding(
    padding: bizCardContentPadding,
    child: Row(
      children: <Widget>[
        Text(
          'Name: ',
          style: bizCardTextStyle,
        ),
        SizedBox(width: 20,),
        Text(
          'Ankush Chavan',
          style: bizCardTextStyle,
        )
      ],
    ),
  );
  var email = Padding(
    padding: bizCardContentPadding,
    child: Row(
     children: <Widget>[
       Text(
         'Email: ',
         style: bizCardTextStyle,
       ),
       SizedBox(width: 20),
       Flexible(
         flex: 1,
         child: Text(
           'ankushchavan.code@gmail.com',
           style: bizCardTextStyle,
         ),
       ),
     ],
    ),
  );
  var mySkills = Padding(
    padding: bizCardContentPadding,
    child: Row(
      children: <Widget>[
        Text(
          'Skills: ',
          style: bizCardTextStyle,
        ),
        SizedBox(width: 25,),
        Flexible(
          child: Text(
            'Hybrid Multi Cloud, DevOps, Java, Python, Flutter, Dart, Redis, Django, RHEL8',
            style: bizCardTextStyle,
          ),
        ),
      ],
    ),
  );
  var bizCardContent = Center(
    child: Container(
      width: 330,
      height: 400,
      child: Column(
        children: <Widget>[
          profilePicture,
          myName,
          email,
          mySkills,
        ],
      ),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(25),
        boxShadow: <BoxShadow>[
          bizCardShadow,
        ],
      ),
    ),
  );
  var bizCard = Scaffold(
    appBar: bizCardAppBar,
    body: bizCardContent,
    backgroundColor: Colors.yellowAccent[100],
  );
  var materialApp = MaterialApp(
    home: bizCard,
  );

  return materialApp;
}

void showUserProfile() {
}
