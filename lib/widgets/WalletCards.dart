import 'package:finance_manager/constants.dart';
import "package:flutter/material.dart";

class WalletCards extends StatelessWidget {
  const WalletCards({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Card(
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("10%",
                      style: kWalletCard.copyWith(fontSize: 14.0)),
                  Text(
                    "На\nинвестиции",
                    style: kWalletCard,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
        Card(
            color: Colors.red,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("15000₽",
                      style: kWalletCard.copyWith(fontSize: 14.0)),
                  Text(
                    "Обязательные\nплатежи",
                    style: kWalletCard,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
        Card(
            color: Colors.black,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Text("5%",
                      style: kWalletCard.copyWith(fontSize: 14.0)),
                  Text(
                    "На черный\nдень",
                    style: kWalletCard,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            )),
        Card(
            color: Colors.lightGreen,
            child: SizedBox(
              height: 55.0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("3000₽",
                        style: kWalletCard.copyWith(fontSize: 14.0)),
                    Text(
                      "Остаток",
                      style: kWalletCard,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}