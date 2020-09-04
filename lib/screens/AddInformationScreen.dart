import 'package:finance_manager/constants.dart';
import 'package:finance_manager/model/ObligatorFactory.dart';
import 'package:finance_manager/model/ObligatorPayment.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import 'package:finance_manager/screens/ErrorScreen.dart';
import 'package:finance_manager/screens/MainScreenHolder.dart';
import 'package:finance_manager/services/AuthService.dart';
import 'package:finance_manager/services/DBService.dart';
import 'package:finance_manager/services/FirebaseDBService.dart';
import 'package:finance_manager/services/TextFieldControllerFactory.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class AddInformationScreen extends StatefulWidget {
  @override
  _AddInformationScreenState createState() => _AddInformationScreenState();
}

class _AddInformationScreenState extends State<AddInformationScreen> {
  // final _formkey = GlobalKey<FormState>();
  final List<ObligatorPayment> obligatorsList = [];
  TextFieldControllerFactory myController;
  ObligatorFactory myObligator;
  double salary = 0.0;

  //Send this to database
  double forInvestment = 0;
  double forRainyDays = 0;
  double allObligatorsSumm = 0.0;
  double balanceAfterAll = 0.0;

  List<Widget> payments = [];

  void deletePayment() {
    List<Widget> list = payments;
    list.removeLast();
    setState(() {
      payments = list;
    });
  }

  void getObligatorsSumm() {
    try {
      for (int i = 0; i < obligatorsList.length; i++) {
        if (obligatorsList[i].getSumm() != null) {
          double x = obligatorsList[i].getSumm();
          allObligatorsSumm = allObligatorsSumm + x;
          print(allObligatorsSumm);
        }
      }
    } catch (e) {
      print(e);
    }
  }

  String getBalance() {
    forInvestment = salary * 0.1;
    balanceAfterAll = salary - forInvestment;
    balanceAfterAll -= allObligatorsSumm;

    forRainyDays = salary * 0.05;
    balanceAfterAll -= forRainyDays;

    return balanceAfterAll.toString();
  }

  void pushInformation() async {
    try {
      final DBService service =
          Provider.of<FirebaseDBService>(context, listen: false);
      String uid = Provider.of<UserProvider>(context, listen: false).uid;
      
      await service.initializeUserInfo(uid, salary, forInvestment, allObligatorsSumm,
          forRainyDays, balanceAfterAll);
      await Provider.of<AuthService>(context, listen: false).updateUserInfo();
      
      double dayBalance = (balanceAfterAll / 30);

      Provider.of<UserProvider>(context, listen: false).setSalary(salary);
      // Provider.of<UserProvider>(context).setForInvestment(forInvestment);
      // Provider.of<UserProvider>(context).setForObligators(allObligatorsSumm);
      // Provider.of<UserProvider>(context).setForRainyDays(forRainyDays);
      // Provider.of<UserProvider>(context).setBalanceForEveryDay(dayBalance.floorToDouble());
      // Provider.of<UserProvider>(context).setBalanceForToday(dayBalance.floorToDouble());
      // Provider.of<UserProvider>(context).setBalanceForTomorrow(dayBalance.floorToDouble());


      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MainScreenHolder()));
    } catch (e) {
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
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 150.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Добавьте информацию", style: kAppBarText),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.only(
                  top: 45.0, left: 24.0, right: 24.0, bottom: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Введите вашу зарплату",
                    style: kSemiBoldTextStyle,
                  ),
                  TextField(
                    onChanged: (val) {
                      setState(() {
                        salary = double.parse(val);
                        getBalance();
                      });
                    },
                    keyboardType: TextInputType.number,
                    style: kEnterSummOnAdd,
                    decoration: InputDecoration(
                        hintText: "100000",
                        hintStyle: kEnterSummOnAdd.copyWith(color: Colors.grey),
                        prefixText: "₽",
                        prefixStyle:
                            kEnterSummOnAdd.copyWith(color: Colors.grey)),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Введите общую сумму обязательных платежей:",
                      style: kSemiBoldTextStyle),
                  TextField(
                    onChanged: (val) {
                      setState(() {
                        allObligatorsSumm = double.parse(val);
                        getBalance();
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: "30000",
                      hintStyle: kRegularTextStyle
                          .copyWith(color: Colors.black)
                          .copyWith(color: Colors.grey),
                    ),
                  ),
                  SizedBox(height: 20.0),
                  Text("Итого:", style: kSemiBoldTextStyle),
                  ListTile(
                    title: Text(
                      "Ваша зарплата",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    trailing: Text("$salary₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "На инвестиции",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    subtitle: Text(
                      "10% на инвестиции",
                      style: kRegularTextStyle.copyWith(color: Colors.grey),
                    ),
                    trailing: Text("$forInvestment₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "Обязательные платежи",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    trailing: Text("-${allObligatorsSumm}₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "На черный день",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    subtitle: Text(
                      "5% на черный день",
                      style: kRegularTextStyle.copyWith(color: Colors.grey),
                    ),
                    trailing: Text("$forRainyDays₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "Остаток",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    trailing: Text("$balanceAfterAll₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: pushInformation,
                          color: Color(0xffFB3B3B),
                          child: Text(
                            "Добавить",
                            style: kRegularTextStyle,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
