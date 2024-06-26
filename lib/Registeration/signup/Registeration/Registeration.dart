// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
import 'package:techmate/Registeration/signup/student/studen_signup.dart';
import 'package:techmate/commponent/button.dart';

class Registeration extends StatelessWidget {
  const Registeration({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 85,
          leading: Padding(
            padding: const EdgeInsets.only(top: 50, left: 15),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          title: Padding(
            padding: const EdgeInsets.only(top: 50, left: 10),
            child: Text(
              'Register as',
              style: TextStyle(
                  color: Color.fromARGB(255, 61, 60, 60), fontSize: 25),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 25),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 50,
                ),
                button_component(
                    usage: "Student", routename: student_signup.routeName),
                SizedBox(
                  height: 35,
                ),
                button_component(
                    usage: 'Recruiter', routename: hr_signup.routeName),
                SizedBox(
                  height: 35,
                ),
                button_component(
                    usage: 'Mentor', routename: mentor_signup.routeName),
                SizedBox(
                  height: 15,
                ),
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
        ));
  }
}
