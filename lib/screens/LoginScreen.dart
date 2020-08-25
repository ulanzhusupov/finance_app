import 'package:finance_manager/constants.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/MainScreenHolder.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/services/FirebaseAuthService.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import "package:flutter/material.dart";
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;

  void signIn(
      BuildContext context, String userEmail, String userPassword) async {
    try {
      final AuthService authService =
          Provider.of<AuthService>(context, listen: false);
      dynamic user =
          await authService.signInWithEmailAndPassword(userEmail, userPassword);
      if (user != null) {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MainScreenHolder()));
      } else if (user != null && user.salary == null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ErrorScreen(
                      msg: "Not have salary",
                    )));
      }
    } catch (e) {
      // print("#### error: " + e.toString());
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ErrorScreen(
                    msg: e.toString(),
                  )));
    }
  }

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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Войдите ${Provider.of<AuthService>(context).currentUser()}",
                style: kRegularTextStyle.copyWith(fontSize: 28.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 50.0,
              ),
              TextFormField(
                onChanged: (val) {
                  email = val;
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return "Введите ваш email!";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                // decoration: InputDecoration(
                //     contentPadding: EdgeInsets.only(
                //         top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                //     hintText: "Введите еmail",
                //     hintStyle: kRegularTextStyle.copyWith(
                //         fontSize: 16.0, color: Colors.white.withOpacity(0.5)),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //         borderSide: BorderSide(color: Colors.white)),
                //     focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //         borderSide: BorderSide(color: Color(0xff2BC773)))),
              ),
              SizedBox(
                height: 20.0,
              ),
              TextFormField(
                obscureText: true,
                onChanged: (val) {
                  password = val;
                },
                validator: (val) {
                  if (val.isEmpty) {
                    return "Введите ваш пароль!";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                // decoration: InputDecoration(
                //     contentPadding: EdgeInsets.only(
                //         top: 10.0, bottom: 10.0, left: 30.0, right: 30.0),
                //     hintText: "Пароль",
                //     hintStyle: kRegularTextStyle.copyWith(
                //         fontSize: 16.0, color: Colors.white.withOpacity(0.5)),
                //     enabledBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //         borderSide: BorderSide(color: Colors.white)),
                //     focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(20.0),
                //         borderSide: BorderSide(color: Color(0xff2BC773)))),
              ),
              SizedBox(height: 50.0),
              Text("или войдите с помощью",
                  style: kRegularTextStyle.copyWith(fontSize: 18.0)),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FlatButton(
                      onPressed: () {},
                      child: SvgPicture.asset(
                        "svg/google.svg",
                        semanticsLabel: "Google",
                        width: 40.0,
                        height: 40.0,
                      )),
                  FlatButton(
                    onPressed: () {},
                    child: SvgPicture.asset(
                      "svg/facebook.svg",
                      semanticsLabel: "Facebook",
                      width: 40.0,
                      height: 40.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 50.0,
              ),
              Row(
                children: [
                  Expanded(
                    child: RaisedButton(
                      onPressed: () async {
                        await signIn(context, email, password);
                      },
                      padding: EdgeInsets.only(top: 22.0, bottom: 22.0),
                      color: kGreenColor,
                      child: Text("Войти", style: kRegularTextStyle),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      )),
    );
  }
}
