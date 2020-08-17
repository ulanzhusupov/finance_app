import 'package:finance_manager/widgets/Menu.dart';
import 'package:finance_manager/widgets/Operations.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
        // accentColor: ,
        // scaffoldBackgroundColor: Colors.blue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Мои финансы"),
      ),
      backgroundColor: Color(0xff2BC773),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
            child: Column(
              children: <Widget>[
                Text(
                  "John Doe,",
                  style: TextStyle(fontSize: 20.0, color: Colors.white),
                ),
                Text("сегодня вы тратите",
                    style: TextStyle(fontSize: 18.0, color: Colors.white)),
                SizedBox(
                  height: 20.0,
                ),
                Text("512 Р",
                    style: TextStyle(
                        fontSize: 36.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0))),
              child: Padding(padding: EdgeInsets.all(8.0), child: Operations()),
            ),
          )
        ],
      ),
      drawer: Menu(),
    );
  }
}
