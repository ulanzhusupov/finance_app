import 'package:finance_manager/screens/LoginScreen.dart';
import 'package:finance_manager/screens/RegisterScreen.dart';
import "package:flutter/material.dart";

import "package:finance_manager/constants.dart";

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.black,
            // image: DecorationImage(
            //     fit: BoxFit.cover,
            //     colorFilter: ColorFilter.mode(
            //         Colors.black.withOpacity(0.8), BlendMode.dstATop)),
          ),
          child: Padding(
            padding: EdgeInsets.all(17.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Контролируйте\nваши финансы!",
                    style: kRegularTextStyle.copyWith(fontSize: 36.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 60.0,
                  ),
                  Text(
                    "Удобная система\nоткладывания денег",
                    style: kRegularTextStyle.copyWith(fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 60.0),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                          color: Colors.white,
                          child: Text("Войти", style: kRegularTextStyle.copyWith(
                            color: Colors.black
                          ),),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
                          },
                          padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                          color: Color(0xff2BC773),
                          child: Text("Регистрация", style: kRegularTextStyle,),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
