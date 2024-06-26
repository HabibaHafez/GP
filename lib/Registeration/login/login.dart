// ignore_for_file: camel_case_types, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:techmate/Registeration/signup/Registeration/Registeration.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';
import 'package:techmate/HomeScreens/home_screen.dart';

class login_screen extends StatelessWidget {
  static const routeName = 'sign in';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'TechMate',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 55,
                ),
                TextField_component(
                  attribute: 'username',
                ),
                SizedBox(
                  height: 35,
                ),
                TextField_component(
                  attribute: 'password',
                ),
                SizedBox(
                  height: 50,
                ),
                button_component(
                    usage: 'Sign in', routename: home_screen.routeName),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registeration()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(fontSize: 16.0, color: const Color.fromRGBO(21, 101, 192, 1)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
