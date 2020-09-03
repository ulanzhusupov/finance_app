import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:finance_manager/constants.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import 'package:finance_manager/screens/AddOperationScreen.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/HomeScreen.dart';
import 'package:finance_manager/screens/OperationsScreen.dart';
import 'package:finance_manager/screens/WalletScreen.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/services/FirebaseAuthService.dart';
import "package:flutter/material.dart";
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:provider/provider.dart';

class MainScreenHolder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final String uid = Provider.of<UserProvider>(context).uid;
    CollectionReference users = FirebaseFirestore.instance.collection("users");

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(uid).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text(snapshot.error);
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          
          Provider.of<UserProvider>(context, listen: false).setSalary(data['salary'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setBalance(data['balance'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setForInvestment(data['forInvestment'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setForObligators(data['obligatorPayments'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setForRainyDays(data['forRainyDays'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setBalanceForEveryDay(data['balanceForEveryDay'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setBalanceForToday(data['balanceForToday'].toDouble());
          Provider.of<UserProvider>(context, listen: false).setBalanceForTomorrow(data['balanceForTomorrow'].toDouble());
          return ScreenTabsCustom();
        }

        return Center(
          child: Loading(
            indicator: BallPulseIndicator(),
            size: 100.0,
          ),
        );
      },
    );
  }
}

class ScreenTabsCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Мои финансы"),
          actions: [
            RaisedButton(
                child: Text("logout"),
                onPressed: () async {
                  try {
                    final AuthService authService =
                        Provider.of<AuthService>(context, listen: false);
                    await authService.signOut();
                  } catch (e) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ErrorScreen()));
                  }
                })
          ],
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddOperationScreen(),
                ));
          },
          label: Text("Добавить операцию", style: kRegularTextStyle),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        backgroundColor: Color(0xff2BC773),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: "Главная",
              ),
              Tab(
                icon: Icon(Icons.list),
                text: "Операции",
              ),
              Tab(
                icon: Icon(Icons.account_balance_wallet),
                text: "Кошелек",
              ),
            ],
            labelColor: Color(0xff2BC773),
            unselectedLabelColor: Colors.grey,
            indicatorSize: TabBarIndicatorSize.label,
            indicatorPadding: EdgeInsets.all(5.0),
            indicatorColor: Color(0xff2BC773),
          ),
        ),
        body: TabBarView(
          children: [HomeScreen(), OperationsScreen(), WalletScreen()],
        ),
      ),
    );
  }
}
