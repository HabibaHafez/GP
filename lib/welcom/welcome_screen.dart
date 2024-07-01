// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/commponent/button.dart';

class welcome_screen extends StatelessWidget {
  static const routeName = 'welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 35, 116, 238),
              Color.fromARGB(255, 234, 242, 249)
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 300, horizontal: 35),
            child: Column(
              children: [
                Center(
                  child: Text(
                    'Welcome to\nTechMate App',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                button_component(
                    usage: "Let's Start", routename: login_screen.routeName,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
