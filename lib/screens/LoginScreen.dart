import 'package:finance_manager/constants.dart';
import "package:flutter/material.dart";

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Войдите",
                  style: kRegularTextStyle.copyWith(fontSize: 28.0),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 50.0,
                ),
                TextFormField(
                  validator: (val) {
                    if(val.isEmpty) {
                      return "Введите ваш email!";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 50.0, right: 50.0),
                    hintText: "Email",
                    hintStyle: kRegularTextStyle.copyWith(
                      fontSize: 18.0,
                      color: Colors.white.withOpacity(0.5)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Color(0xff2BC773))
                    )
                  ), 
                ),
                SizedBox(height: 20.0,),
                TextFormField(
                  validator: (val) {
                    if(val.isEmpty) {
                      return "Введите ваш email!";
                    }
                    return null;
                  },
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 20.0, bottom: 20.0, left: 50.0, right: 50.0),
                    hintText: "Пароль",
                    hintStyle: kRegularTextStyle.copyWith(
                      fontSize: 18.0,
                      color: Colors.white.withOpacity(0.5)
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Colors.white)
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0),
                      borderSide: BorderSide(color: Color(0xff2BC773))
                    )
                  ),
                ),
                SizedBox(height: 50.0),
                Text("или войдите с помощью", style: kRegularTextStyle.copyWith(
                  fontSize: 18.0
                )),
                SizedBox(height: 50.0),

              ],
            ),
          ),
        ),
      )),
    );
  }
}
