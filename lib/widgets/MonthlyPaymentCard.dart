import 'package:finance_manager/constants.dart';
import "package:flutter/material.dart";

class MonthlyPaymentCard extends StatelessWidget {
  const MonthlyPaymentCard({
    Key key,
    this.title,
    this.lastPayment
  }) : super(key: key);

  final String title;
  final String lastPayment;



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white, boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.2),
          spreadRadius: 1.0,
          blurRadius: 5.0,
          offset: Offset(0, -1.0)
        )
      ]),
      child: ExpansionTile(
        title: Text(title, style: kSemiBoldTextStyle),
        subtitle: Text("Последний платеж $lastPayment", style: kSemiBoldTextStyle.copyWith(
          color: Color(0xfff999999),
          fontSize: 10.0
        ),),
        tilePadding: EdgeInsets.only(top: 15.0, bottom: 15.0, left: 30.0, right: 30.0),
        childrenPadding: EdgeInsets.only(top: 0.0, left: 30.0, bottom: 15.0, right: 30.0),
        expandedAlignment: Alignment.centerLeft,
        children: [
          Text("На инвестиции будут взяты 10%",
              style:
                  kRegularTextStyle.copyWith(color: Colors.black)),
        ],
      ),
    );
  }
}