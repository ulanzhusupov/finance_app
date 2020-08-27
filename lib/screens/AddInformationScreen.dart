import 'package:finance_manager/constants.dart';
import "package:flutter/material.dart";

class AddInformationScreen extends StatefulWidget {
  @override
  _AddInformationScreenState createState() => _AddInformationScreenState();
}

class _AddInformationScreenState extends State<AddInformationScreen> {
  int salary;
  Map<String, int> obligators = {};
  String obligatorName;
  int obligatorSumm;

  void handleChangeSalary(val) {
    setState(() {
      salary = val;
    });
  }

  void handleChangeObligatorName(val) {
    setState(() {
      obligatorName = val;
    });
  }
  void handleChangeObligatorSumm(val) {
    if(obligators.containsKey(obligatorName)) {
      
       obligatorSumm = val;
       obligators.update(obligatorName, (v) => val);
      } else {
      obligators.putIfAbsent(obligatorName, () => 0);
    }
  }

  List<Widget> payments = [];

  void deletePayment() {
    List<Widget> list = payments;
    list.removeLast();
    setState(() {
      payments = list;
    });
  }

  void addNewPayment() {
    print(obligators);
    Row newPayment = Row(
      children: [
        Expanded(
          child: TextField(
            onChanged: handleChangeObligatorName,
            keyboardType: TextInputType.name,
            decoration: InputDecoration(
              hintText: "За квартиру",
              hintStyle: kRegularTextStyle
                  .copyWith(color: Colors.black)
                  .copyWith(color: Colors.grey),
            ),
          ),
        ),
        Container(
          width: 100.0,
          padding: EdgeInsets.only(left: 20.0),
          child: TextField(
            onChanged: handleChangeObligatorSumm,
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                hintText: "25000",
                hintStyle: kRegularTextStyle
                    .copyWith(color: Colors.black)
                    .copyWith(color: Colors.grey)),
          ),
        )
      ],
    );
    setState(() {
      payments.add(newPayment);
    });
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
                      hintStyle: kEnterSummOnAdd.copyWith(
                        color: Colors.grey
                      ),
                      prefixText: "₽",
                      prefixStyle: kEnterSummOnAdd.copyWith(
                        color: Colors.grey
                      )
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Добавьте обязательные платежи:",
                      style: kSemiBoldTextStyle),
                  Column(
                    children: payments,
                  ),
                  // getPayments(),
                  Row(
                    children: [
                      OutlineButton(
                        onPressed: () {
                          addNewPayment();
                        },
                        color: Colors.lightBlueAccent,
                        child: Icon(Icons.add),
                      ),
                      OutlineButton(
                        onPressed: () {
                          deletePayment();
                        },
                        color: Colors.lightBlueAccent,
                        child: Icon(Icons.delete_outline),
                      ),
                    ],
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
                    trailing: Text("-26000₽",
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
                  SizedBox(
                    height: 40.0,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: RaisedButton(
                          onPressed: () {},
                          color: Color(0xffFB3B3B),
                          child: Text("Добавить", style: kRegularTextStyle,),
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
