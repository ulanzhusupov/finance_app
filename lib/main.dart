import 'package:finance_manager/screens/AddOperationScreen.dart';
import 'package:finance_manager/screens/HomeScreen.dart';
import 'package:finance_manager/screens/OperationsScreen.dart';
import 'package:finance_manager/screens/WalletScreen.dart';
import 'package:finance_manager/widgets/OperationList.dart';
import 'package:finance_manager/widgets/WalletCards.dart';
import 'package:flutter/material.dart';

import 'constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Color(0xff2BC773),
        accentColor: Color(0xffFB3B3B),
        // scaffoldBackgroundColor: Colors.blue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: TabController(),
    );
  }
}

class TabController extends StatelessWidget {
  const TabController({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Мои финансы"),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddOperationScreen(),
            ));
          },
          label: Text("Добавить операцию", style: kRegularTextStyle),
        ),
        floatingActionButtonLocation:
            FloatingActionButtonLocation.centerFloat,
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




