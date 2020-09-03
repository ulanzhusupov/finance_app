import 'package:finance_manager/constants.dart';
import 'package:finance_manager/screens/AddInformationScreen.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/MainScreenHolder.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/widgets/InputTextFormField.dart';
import 'package:finance_manager/widgets/SocialAuth.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

import '../services/AuthService.dart';

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
      if (user != null && user.salary == null) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => AddInformationScreen()));
      } else {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => MainScreenHolder()));
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
              InputTextFormField(
                fieldName: "email",
                isObscure: false,
                fieldType: TextInputType.emailAddress,
                onChanged: (val) {
                  email = val;
                },
              ),
              SizedBox(
                height: 20.0,
              ),
              InputTextFormField(
                fieldName: "пароль",
                isObscure: true,
                fieldType: TextInputType.visiblePassword,
                onChanged: (val) {
                  password = val;
                },
              ),
              SizedBox(height: 50.0),
              Text("или войдите с помощью",
                  style: kRegularTextStyle.copyWith(fontSize: 18.0)),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SocialAuth(
                    iconPath: "svg/google.svg",
                    onPressed: () async {
                      try {
                        final AuthService service =
                            Provider.of<AuthService>(context, listen: false);
                        await service.signInWithGoogle();
                      } catch (e) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ErrorScreen(
                                      msg: e.toString(),
                                    )));
                      }
                    },
                    label: "Google",
                  ),
                  SocialAuth(
                    iconPath: "svg/facebook.svg",
                    onPressed: () {},
                    label: "Facebook",
                  ),
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
