import 'package:finance_manager/constants.dart';
import 'package:finance_manager/model/ObligatorFactory.dart';
import 'package:finance_manager/model/ObligatorPayment.dart';
import 'package:finance_manager/services/TextFieldControllerFactory.dart';
import "package:flutter/material.dart";

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
  int investment = 0;
  double allObligatorsSumm = 0.0;
  int toRainyDays = 0;
  double balanceAfterAll = 0.0;

  void handleChangeSalary(val) {
    setState(() {
      salary = val;
    });
  }

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
    double toInvest = salary * 0.1;
    salary = salary - toInvest;
    salary -= allObligatorsSumm;

    double toBadDay = salary * 0.05;
    salary -= toBadDay;
    balanceAfterAll = salary;

    return balanceAfterAll.toString();
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
              title: Text("Добавить информацию", style: kAppBarText),
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
                    onChanged: handleChangeSalary,
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
                        getObligatorsSumm();
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
                    trailing: Text("${salary != null ? salary : '0'}₽",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "На инвестиции",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    subtitle: Text(
                      "Будет вычитаться первым",
                      style: kRegularTextStyle.copyWith(color: Colors.grey),
                    ),
                    trailing: Text("-10%",
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
                    trailing: Text("-5%",
                        style: kRegularTextStyle.copyWith(
                            color: Colors.black, fontWeight: FontWeight.bold)),
                  ),
                  ListTile(
                    title: Text(
                      "Остаток",
                      style: kRegularTextStyle.copyWith(color: Colors.black),
                    ),
                    trailing: Text("${getBalance()}₽",
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
                          onPressed: () {},
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
