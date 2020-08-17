import "package:flutter/material.dart";

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text("Мои финансы"),
            decoration: BoxDecoration(color: Colors.red),
          ),
          ListTile(
            title: Text("Операции"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Операции"),
            onTap: () {},
          ),
          ListTile(
            title: Text("Операции"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
