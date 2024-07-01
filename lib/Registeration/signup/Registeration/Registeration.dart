import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/HR/hr_signup.dart';
import 'package:techmate/Registeration/signup/Mentor/mentor_signup.dart';
import 'package:techmate/Registeration/signup/student/studen_signup.dart';

class Registeration extends StatefulWidget {
  const Registeration({super.key});

  @override
  _RegisterationState get createState => _RegisterationState();
}

class _RegisterationState extends State<Registeration> {
  Future<void> setRole(String role) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('role', role);
  }

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
              color: Color.fromARGB(255, 61, 60, 60),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 150, horizontal: 25),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  setRole('student');
                  Navigator.of(context).pushNamed(StudentSignup.routeName);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 55),
                  backgroundColor: Color.fromARGB(255, 48, 134, 232),
                ),
                child: Text(
                  'Student',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  setRole('recruiter');
                  Navigator.of(context).pushNamed(hr_signup.routeName);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 55),
                  backgroundColor: Color.fromARGB(255, 48, 134, 232),
                ),
                child: Text(
                  'Recruiter',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 35),
              ElevatedButton(
                onPressed: () {
                  setRole('mentor');
                  Navigator.of(context).pushNamed(mentor_signup.routeName);
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(400, 55),
                  backgroundColor: Color.fromARGB(255, 48, 134, 232),
                ),
                child: Text(
                  'Mentor',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 15),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
