import 'package:finance_manager/constants.dart';
import 'package:finance_manager/screens/AddOperationScreen.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/HomeScreen.dart';
import 'package:finance_manager/screens/OperationsScreen.dart';
import 'package:finance_manager/screens/WalletScreen.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/services/FirebaseAuthService.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class MainScreenHolder extends StatelessWidget {
  const MainScreenHolder({
    Key key,
  }) : super(key: key);

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
                    final AuthService authService = Provider.of<AuthService>(context, listen: false);
                    await authService.signOut();
                  } catch(e) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorScreen()));
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
