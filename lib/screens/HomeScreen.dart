import 'package:finance_manager/constants.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import "package:flutter/material.dart";
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../widgets/Menu.dart';
import '../widgets/OperationList.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          title: Row(
            children: [
              Text("На сегодня: ",
                  style: TextStyle(fontSize: 18.0, color: Colors.white)),
              Text(
                  "${Provider.of<UserProvider>(context, listen: false).balanceForToday} ₽",
                  style: TextStyle(
                      fontSize: 36.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          pinned: false,
          leading: Icon(Icons.home),
          expandedHeight: 50.0,
        ),
        // SliverToBoxAdapter(
        //   child: Expanded(
        //     child: Container(
        //       padding: EdgeInsets.only(
        //           top: 45.0, left: 24.0, right: 24.0, bottom: 20.0),
        //       decoration: BoxDecoration(
        //           color: Colors.white,
        //           borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(30.0),
        //               topRight: Radius.circular(30.0))),
        //       child:
        //           Padding(padding: EdgeInsets.all(8.0), child: OperationList()),
        //     ),
        //   ),
        // ),
        SliverList(
          delegate:
              SliverChildBuilderDelegate((context, int index) {
            return Card(
              child: ListTile(
                title: Text(
                  "Еда",
                  style: kSemiBoldTextStyle,
                ),
                subtitle: Text(
                  "В доме не осталось еды",
                ),
                trailing: Text("-312 Р", style: kSemiBoldTextStyle),
              ),
            );
          }),
        )
      ],
    );
  }
}

/*

Column(
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

    */
