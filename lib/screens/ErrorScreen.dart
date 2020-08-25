import "package:flutter/material.dart";

class ErrorScreen extends StatelessWidget {
  String msg;
  ErrorScreen({this.msg});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        child: Container(
          child: Text("Error: " + msg),
        ),
      ),
    );
  }
}