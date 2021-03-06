import 'package:finance_manager/model/User.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import 'package:finance_manager/screens/AddInformationScreen.dart';
import 'package:finance_manager/screens/AddOperationScreen.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/HomeScreen.dart';
import 'package:finance_manager/screens/LoginScreen.dart';
import 'package:finance_manager/screens/MainScreenHolder.dart';
import 'package:finance_manager/screens/OperationsScreen.dart';
import 'package:finance_manager/screens/RegisterScreen.dart';
import 'package:finance_manager/screens/WalletScreen.dart';
import 'package:finance_manager/screens/WelcomeScreen.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/services/DBService.dart';
import 'package:finance_manager/services/FirebaseAuthService.dart';
import 'package:finance_manager/services/FirebaseDBService.dart';
import 'package:finance_manager/widgets/OperationList.dart';
import 'package:finance_manager/widgets/WalletCards.dart';
import 'package:firebase_auth/firebase_auth.dart' as fAuth;
import 'package:flutter/material.dart';
import 'package:loading/indicator.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/indicator/ball_scale_indicator.dart';
import 'package:loading/loading.dart';
import "package:provider/provider.dart";
import "package:firebase_core/firebase_core.dart";

import 'constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp(
    authService: (_) => FirebaseAuthService(),
    databaseService: (_) => FirebaseDBService(),
    userProvider: (_) => UserProvider(),
  ));
}

class MyApp extends StatelessWidget {
  final FirebaseAuthService Function(BuildContext context) authService;
  final FirebaseDBService Function(BuildContext context) databaseService;
  final UserProvider Function(BuildContext context) userProvider;

  MyApp({Key key, this.authService, this.databaseService, this.userProvider}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: authService,),
        Provider<FirebaseDBService>(create: databaseService,),
        ChangeNotifierProvider<UserProvider>(create: userProvider)
      ],
      
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xff2BC773),
          accentColor: Color(0xffFB3B3B),
          // scaffoldBackgroundColor: Colors.blue[800],
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: ScreenWrapper(),
      ),
    );
  }
}

class ScreenWrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final AuthService authService = Provider.of<AuthService>(context);
    return StreamBuilder<User>(
        stream: authService.onAuthStateChanged,
        builder: (_, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            final User user = snapshot.data;
            print("##################22222222222 This is user: "+snapshot.data.toString());
            double userSalary = Provider.of<UserProvider>(context).salary;

            if (user == null) {
              return WelcomeScreen();
            } else if (user != null && user.isAddedInfo == true) {
              Provider.of<UserProvider>(context).setUid(user.uid);
              return AddInformationScreen();
            } else {
              Provider.of<UserProvider>(context).setUid(user.uid);
              return MainScreenHolder();
            }


          } else {
            return Center(
              child: Loading(
                indicator: BallPulseIndicator(),
                size: 100.0,
              ),
            );
          }
        });
  }
}
