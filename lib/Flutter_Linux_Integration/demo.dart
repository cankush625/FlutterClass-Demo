import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _WebState createState() => _WebState();
}
// ignore: non_constant_identifier_names
class _WebState extends State<Home> {
  var serverDate = " ";

  @override
  Widget build(BuildContext context) {
    var homeAppBarTitle = Text('Webserver Manager');
    var appLogo = Image.network(
      'https://i1.wp.com/sovitpoudel.com.np/wp-content/uploads/2019/01/flutter.png',
    );
    var appBarBGColor = Colors.pink[500];
    var userProfilePicture = Icon(Icons.account_circle);

    var homeAppBar = AppBar(
      title: homeAppBarTitle,
      leading: appLogo,
      backgroundColor: appBarBGColor,
      actions: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 20, 0),
          child: userProfilePicture,
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

    mydate() async {
      var url = "http://13.232.177.94/cgi-bin/date.py";
      var result = await http.get(url);
      var data = result.body;
      setState(() {
        serverDate = data;
      });
      print(data);
    }

    mycal() async {
      var url = "http://13.232.177.94/cgi-bin/cal.py";
      var result = await http.get(url);
      var data = result.body;
      print(data);
    }

    void mywebpage() async {
      var url = "http://13.232.177.94/index.html";
      var result = await http.get(url);
      var data = result.body;
      print(data);
    }

    var getServerDateTime = RaisedButton(
      onPressed: mydate,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Color(0xFF0D47A1),
              Color(0xFF1976D2),
              Color(0xFF42A5F5),
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child:
        const Text('   Server Date Time    ', style: TextStyle(fontSize: 20)),
      ),
    );
    var getCalenderfromServer = RaisedButton(
      onPressed: mycal,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.green,
              Colors.green,
              Colors.greenAccent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child:
        const Text('Calender from server', style: TextStyle(fontSize: 20)),
      ),
    );
    var getWebpageContent = RaisedButton(
      onPressed: mywebpage,
      textColor: Colors.white,
      padding: const EdgeInsets.all(0.0),
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: <Color>[
              Colors.deepOrangeAccent,
              Colors.orange,
              Colors.orangeAccent,
            ],
          ),
        ),
        padding: const EdgeInsets.all(10.0),
        child:
        const Text('   Webpage Content   ', style: TextStyle(fontSize: 20)),
      ),
    );
    var space = SizedBox(
      height: 30,
    );
    var displayServerDate = Padding(
      padding: EdgeInsets.only(top: 40,),
        child: Column(
          children: <Widget>[
            Text(
              'Server Date',
              style: TextStyle(
              fontSize: 24,
              ),
            ),
            SizedBox(height: 10,),
            Text(
                serverDate,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        )
    );
    Widget webServerManagerBody = Center(
      child: Column(
        children: <Widget>[
          space,
          getServerDateTime,
          space,
          getCalenderfromServer,
          space,
          getWebpageContent,
          displayServerDate,
        ],
      ),
    );
    return webServerManagerBody;
  }
}
