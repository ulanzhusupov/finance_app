import 'package:finance_manager/widgets/OperationList.dart';
import "package:flutter/material.dart";

import '../constants.dart';

class OperationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 35.0, left: 20.0, right: 20.0, bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            "Операции",
            style: kBoldTextStyle,
          ),
          SizedBox(
            height: 40.0,
          ),
          Expanded(
            child: Container(
              child: OperationList(),
            ),
          )
        ],
      ),
    );
  }
}