import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/Registeration/signup/user/user_signup.dart';
import 'package:techmate/Registeration/validations/validator.dart';
 // Import ContinuedSignup screen

class StudentSignup extends StatefulWidget {
  static const routeName = 'student_signup';

  @override
  _StudentSignupState  createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLevel;
  final _userSignupKey = GlobalKey<UserSignupState>();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Sign Up'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.blue[800],
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                UserSignup(key: _userSignupKey),
                SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: _selectedLevel,
                  hint: Text('Level'),
                  items: ['1', '2', '3', '4'].map((String level) {
                    return DropdownMenuItem<String>(
                      value: level,
                      child: Text(level),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedLevel = value;
                    });
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() &&
                        _userSignupKey.currentState!.validate()) {
                      // Navigate to ContinuedSignup and pass password
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ContinuedSignup(
                            firstName: _userSignupKey.currentState!.firstName,
                            lastName: _userSignupKey.currentState!.lastName,
                            email: _userSignupKey.currentState!.email,
                            nationalId: _userSignupKey.currentState!.nationalId,
                            address: _userSignupKey.currentState!.address,
                            gender: _userSignupKey.currentState!.gender!,
                            level: _selectedLevel!,
                          ),
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 55),
                    backgroundColor: Color.fromARGB(255, 48, 134, 232),
                  ),
                  child: Text(
                    'Continue',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, login_screen.routeName);
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
      ),
    );
  }
}
