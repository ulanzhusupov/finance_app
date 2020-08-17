import 'package:finance_manager/screens/HomeScreen.dart';
import 'package:finance_manager/screens/OperationsScreen.dart';
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
        // accentColor: ,
        // scaffoldBackgroundColor: Colors.blue[800],
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            title: Text("Мои финансы"),
          ),
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {},
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
      ),
    );
  }
}

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(27.0),
            child: Column(children: [
              Text("Ваша зарплата",
                  style: kBoldTextStyle.copyWith(color: Colors.white)),
              SizedBox(
                height: 15.0,
              ),
              Text("60 000 Р",
                  style: kBoldTextStyle.copyWith(
                      color: Colors.white, fontSize: 46.0)),
              FlatButton(
                padding: EdgeInsets.all(0),
                onPressed: () {},
                child: Text("Изменить",
                    style: kSemiBoldTextStyle.copyWith(color: Colors.white)),
              ),
              WalletCards()
            ]),
          )
        ],
      ),
    );
  }
}


