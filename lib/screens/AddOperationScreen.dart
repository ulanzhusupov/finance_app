import 'package:finance_manager/constants.dart';
import 'package:flutter/material.dart';

enum OperationType { income, outcome }

class AddOperationScreen extends StatefulWidget {
  @override
  _AddOperationScreenState createState() => _AddOperationScreenState();
}

class _AddOperationScreenState extends State<AddOperationScreen> {
  OperationType _operationType = OperationType.income;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Добавить операцию", style: kAppBarText,),
      ),
      backgroundColor: Color(0xff2BC773),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pop(context);
        },
        label: Text("Добавить", style: kRegularTextStyle),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(40),
            child: Text("Введите значения",
                style: kBoldTextStyle.copyWith(color: Colors.white)),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(25.0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                TextField(
                  onChanged: (val) {},
                  autofocus: true,
                  textAlign: TextAlign.end,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: "сумма",
                      hintStyle: TextStyle(color: Color(0xffB6B6B6)),
                      prefixText: "₽",
                      prefixStyle: TextStyle(color: Color(0xffB6B6B6), fontSize: 36.0)),
                  style: kEnterSummOnAdd,
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: OperationType.income,
                          groupValue: _operationType,
                          onChanged: (OperationType val) {
                            setState(() {
                              _operationType = val;
                            });
                          },
                        ),
                        title: Text(
                          "расход",
                          style: kSemiBoldTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListTile(
                        leading: Radio(
                          value: OperationType.outcome,
                          groupValue: _operationType,
                          onChanged: (OperationType val) {
                            setState(() {
                              _operationType = val;
                            });
                          },
                        ),
                        title: Text(
                          "прибыль",
                          style: kSemiBoldTextStyle,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 40.0
                ),
                Text("Введите название операции", style: kSemiBoldTextStyle),
                SizedBox(height: 20.0),
                TextField(
                  onChanged: (val) {},
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Например: Еда, Интернет, Бургер",
                      hintStyle: TextStyle(color: Color(0xffB6B6B6)),
                  ),
                  style: kOperationInfoEnter,
                ),
                SizedBox(
                  height: 20.0
                ),
                Text("Введите краткое описание (по желанию)", style: kSemiBoldTextStyle),
                SizedBox(height: 20.0),
                TextField(
                  onChanged: (val) {},
                  textAlign: TextAlign.start,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      hintText: "Например: В доме не осталось еды",
                      hintStyle: TextStyle(color: Color(0xffB6B6B6)),
                  ),
                  style: kOperationInfoEnter,
                ),


              ]),
            ),
          ),
        ],
      ),
    );
  }
}
