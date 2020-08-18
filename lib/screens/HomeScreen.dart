import 'package:finance_manager/constants.dart';
import "package:flutter/material.dart";

import '../widgets/Menu.dart';
import '../widgets/OperationList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          // color: Color(0xff2BC773),
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
            child:
                Padding(padding: EdgeInsets.all(8.0), child: OperationList()),
          ),
        )
      ],
    );
  }
}
