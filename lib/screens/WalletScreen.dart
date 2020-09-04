import 'package:finance_manager/constants.dart';
import 'package:finance_manager/provider/UserProvider.dart';
import 'package:finance_manager/widgets/MonthlyPaymentCard.dart';
import 'package:finance_manager/widgets/WalletCards.dart';
import "package:flutter/material.dart";
import 'package:provider/provider.dart';

class WalletScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          pinned: true,
          expandedHeight: 250.0,
          flexibleSpace: Center(
            child: Column(children: [
              Text("Ваша зарплата",
                  style: kBoldTextStyle.copyWith(color: Colors.white)),
              SizedBox(
                height: 15.0,
              ),
              Text("${Provider.of<UserProvider>(context, listen: false).salary}₽",
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
          ),
        ),
        SliverToBoxAdapter(
          child: Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                  MonthlyPaymentCard(title: "Инвестиции", lastPayment: "22.08.20", investment: Provider.of<UserProvider>(context, listen: false).forInvestment,),
                  SizedBox(height: 15.0,),
                  MonthlyPaymentCard(title: "Обязательные платежи", lastPayment: "22.08.20",),
                  SizedBox(height: 15.0,),
                  MonthlyPaymentCard(title: "На черный день", lastPayment: "22.08.20",),
                ]),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/*

Container(
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
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: Column(
                  children: [
                  MonthlyPaymentCard(title: "Инвестиции", lastPayment: "22.08.20",),
                  SizedBox(height: 15.0,),
                  MonthlyPaymentCard(title: "Обязательные платежи", lastPayment: "22.08.20",),
                  SizedBox(height: 15.0,),
                  MonthlyPaymentCard(title: "На черный день", lastPayment: "22.08.20",),
                ]),
              ),
            ),
          )
        ],
      ),
    );

    **/
