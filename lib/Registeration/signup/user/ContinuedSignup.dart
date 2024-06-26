// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/student/skills_choosen.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';

class ContinuedSignup extends StatelessWidget {
  static const routeName = 'ContinuedSignup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 45,
        leading: Padding(
          padding: const EdgeInsets.only(top: 30, left: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 35),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                TextField_component(attribute: 'password'),
                SizedBox(
                  height: 30,
                ),
                TextField_component(attribute: 'confirm password'),
                SizedBox(
                  height: 80,
                ),
                button_component(
                    usage: 'Sign up', routename: ChooseSkills.routeName),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => login_screen()),
                    );
                  },
                  child: Text(
                    "Already have an account? Login",
                    style: TextStyle(fontSize: 16.0, color: Colors.blue[800]),
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
