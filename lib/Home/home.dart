import 'package:flutter/material.dart';

// ignore: non_constant_identifier_names
Widget MyApp() {
  var homeAppBarTitle = Text('Custom Flutter App');
  var appLogo = Image.network(
    'https://i1.wp.com/sovitpoudel.com.np/wp-content/uploads/2019/01/flutter.png',
  );
  var appBarBGColor = Colors.pink[500];
  var userProfilePicture = Icon(Icons.account_circle);
  var clickableUserProfilePicture = IconButton(
    icon: userProfilePicture,
    onPressed: showUserProfile,
  );

  var homeAppBar = AppBar(
    title: homeAppBarTitle,
    leading: appLogo,
    backgroundColor: appBarBGColor,
    actions: <Widget>[
      Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
        child: clickableUserProfilePicture,
      ),
    ],
  );

  var myHome = Scaffold(
    appBar: homeAppBar,
    body: homeScreenBody(),
  );

  var materialApp = MaterialApp(
    home: myHome,
    debugShowCheckedModeBanner: false,
  );

  return materialApp;
}

Widget homeScreenBody() {
  double normalFontSize = 25;
  var normalFontWeight = FontWeight.w600;
  var developerName = Padding(
    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
    child: Text(
      'Developed by: Ankush Chavan',
      style: TextStyle(
        fontSize: normalFontSize,
        fontWeight: normalFontWeight,
        color: Colors.black54,
      ),
    )
  );
  var developerImage = Padding(
    padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
    child: Image.network(
    'https://avatars1.githubusercontent.com/u/41515472?s=460&u=2e83d208268b51f32d5212de73328a501ecd4ce5&v=4'
    )
  );

  var developers = Container(
    child: Column(
      children: <Widget>[
        developerName,
        developerImage,
      ],
    ),
  );
  return developers;
}

int counter = 0;
void showUserProfile() {
  counter++;
  String message = 'ShowUserProfile pressed $counter times';
  print(message);
}
