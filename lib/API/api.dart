import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import '';

class Api extends StatefulWidget {
  @override
  _ApiState createState() => _ApiState();
}
// ignore: non_constant_identifier_names
class _ApiState extends State<Api> {
  String cityName = " ";
  Map data = {};
  var temperature;
  var weather;
  var date;
  var wind;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Weather App'),
        ),
        body: SafeArea(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 30,
              ),
              Text(
                'Search for a city',
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
                    hintText: "Enter the city name",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (x) {
                    cityName = x;
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RaisedButton(
                child: Text(
                    'Search'
                ),
                onPressed: () async {
                  Response response = await http.get("http://api.openweathermap.org/data/2.5/forecast?q=$cityName&appid=111056e251e0e&units=metric");
                  data = jsonDecode(response.body);
                  setState(() {
                    temperature = data["list"][1]["main"]["temp"];
                    weather = data["list"][1]["weather"][0]["main"];
                    date = data["list"][1]["dt_txt"];
                    wind = data["list"][1]["wind"]["speed"];
                  });
                },
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 50,),
                child: Column(
                  children: <Widget>[
                    Text(
                      '$cityName',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      '$date',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.blueAccent[700],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.wb_sunny,
                          color: Colors.red,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$temperature',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.cloud,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$weather',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.terrain,
                          color: Colors.grey,
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          '$wind',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}