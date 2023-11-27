import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controller/customer_button.dart';
import '../player/view/player_screen.dart';

class LogoutScreen extends StatefulWidget {
  const LogoutScreen({super.key});

  @override
  State<LogoutScreen> createState() => _LogoutScreenState();
}

class _LogoutScreenState extends State<LogoutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomerButtom(
            title: 'play music',
            color: Colors.green,
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => PlayerScreen(),
              ));
            },
          ),


          SizedBox(
            height: 10,
          ),
          CustomerButtom(
            title: 'log out  !!!!!',
            color: Colors.red,
            onPressed: () {
              setState(() {
                // delete token then exit from applcation
                deletetokeName();
                exit(0);
              });
            },
          ),
        ],
      ),
    );
  }
}

Future<void> deletetokeName() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('token');
  await prefs.remove('user');
}


// delete user
