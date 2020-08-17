import "package:flutter/material.dart";

class Operations extends StatelessWidget {
  const Operations({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("Последние операции"),
        ListView(
          children: <Widget>[
            Card(
              child: ListTile(
                title: Text("Еда"),
                subtitle: Text("В доме не осталось еды"),
                trailing: Text(
                  "-312 Р",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Еда"),
                subtitle: Text("В доме не осталось еды"),
                trailing: Text(
                  "-312 Р",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text("Еда"),
                subtitle: Text("В доме не осталось еды"),
                trailing: Text(
                  "-312 Р",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
