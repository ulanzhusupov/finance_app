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
            image: DecorationImage(
                image: AssetImage("images/back.jpg"),
                fit: BoxFit.cover,
                colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(0.8), BlendMode.dstATop)),
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
                          onPressed: () {},
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
                          onPressed: () {},
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
