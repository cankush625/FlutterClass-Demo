import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  @override
  _WebState createState() => _WebState();
}
// ignore: non_constant_identifier_names
class _WebState extends State<Home> {
  var output = " ";
  var msgLine = " ";
  String commandName = " ";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('WebServer Manager'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Execute commands on server',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Enter the command",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (x) {
                    commandName = x;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                    'Execute'
                ),
                onPressed: () async {
                  var url = "http://13.126.39.8/cgi-bin/${commandName}.py";
                  var result = await http.get(url);
                  var data = result.body;
                  setState(() {
                    msgLine = "Output of the ${commandName} comamnd is: ";
                    output = data;
                  });
                  print(data);
                },
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                child: Column(
                  children: <Widget>[
                    Text(
                      '${msgLine}',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '${output}',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
