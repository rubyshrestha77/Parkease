// import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:parkease/dashboard.dart';
import 'package:parkease/home_page.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text("UserName"),
            accountEmail: Text("UserEmail@gmail.com"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(Icons.account_circle),
              ),
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 98, 190, 236),
            ),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home Page'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Dashboard()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('My Profile'),
            onTap: () => print(''),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Setting'),
            onTap: () => print(''),
          ),
          ListTile(
              leading: Icon(Icons.logout),
              title: Text('Sign Out'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHome()),
                );
              })
        ],
      ),
    );
  }
}
