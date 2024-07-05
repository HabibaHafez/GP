import 'dart:math';

import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/validations/validator.dart';
import 'package:techmate/services/registeration/signup/Mentor/MentorApi.dart';
import 'package:techmate/services/registeration/signup/Student/studentApi.dart';
import 'package:techmate/services/registeration/signup/Recruiter/RecruiterApi.dart';

import 'package:techmate/shared%20attributes/shared.dart';

class ContinuedSignup extends StatefulWidget {
  static const routeName = 'ContinuedSignup';

  final String firstName;
  final String lastName;
  final String email;
  final String nationalId;
  final String? address; // Nullable type for optional parameters
  final String? gender; // Nullable type for optional parameters
  final String? level; // Nullable type for optional parameters
  final String? jobtitle; // Nullable type for optional parameters
  final String? companyName;

  ContinuedSignup({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nationalId,
    this.address,
    this.gender,
    this.level,
    this.jobtitle,
    this.companyName,
  });

  factory ContinuedSignup.fromStudent({
    required String firstName,
    required String lastName,
    required String email,
    required String nationalId,
    required String address,
    required String gender,
    required String level,
  }) {
    return ContinuedSignup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      nationalId: nationalId,
      address: address,
      gender: gender,
      level: level,
    );
  }

  factory ContinuedSignup.fromMentor({
    required String firstName,
    required String lastName,
    required String email,
    required String nationalId,
    String? gender,
    required String jobtitle,
  }) {
    return ContinuedSignup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      nationalId: nationalId,
      gender: gender,
      jobtitle: jobtitle,
    );
  }

  factory ContinuedSignup.fromRecruiter({
    required String firstName,
    required String lastName,
    required String email,
    required String nationalId,
    String? gender,
    required String companyName,
    required String jobtitle,
  }) {
    return ContinuedSignup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      nationalId: nationalId,
      gender: gender,
      companyName: companyName,
      jobtitle: jobtitle,
    );
  }

  @override
  _ContinuedSignupState createState() => _ContinuedSignupState();
}

class _ContinuedSignupState extends State<ContinuedSignup> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  Future<String?> role = getRole();

  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      bool isRegistered = false;
      String? userRole = await role;
      print('User role: $userRole');

      // Simulate area of interest for demo purposes
      String areaOfInterest = "Data Analysis";

      if (userRole == 'student') {
        isRegistered = await registerStudent(
          widget.firstName,
          widget.lastName,
          widget.email,
          widget.nationalId,
          widget.address!,
          widget.gender!,
          widget.level!,
          _passwordController.text,
          areaOfInterest,
        );
      } else if (userRole == 'mentor') {
        isRegistered = await registerMentor(
          widget.firstName,
          widget.lastName,
          widget.email,
          widget.nationalId,
          widget.gender!,
          widget.jobtitle!,
          _passwordController.text,
          areaOfInterest,
        );
      } else if (userRole == 'recruiter') {
        isRegistered = await registerRecruiter(
          widget.firstName,
          widget.lastName,
          widget.email,
          widget.nationalId,
          widget.gender!,
          widget.companyName!,
          widget.jobtitle!,
          _passwordController.text,
        );
      }

      if (isRegistered) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login_screen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Registration failed. Please try again.';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Error: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Text(
                    'Sign up',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(labelText: 'Password'),
                    obscureText: true,
                    validator: (value) => Validator.validatePassword(value!),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) => Validator.validateConfirmPassword(
                      value!,
                      _passwordController.text,
                    ),
                  ),
                  SizedBox(height: 80),
                  _isLoading
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                          onPressed: _registerUser,
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(400, 55),
                            backgroundColor: Color.fromARGB(255, 48, 134, 232),
                          ),
                          child: Text(
                            'Sign Up',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                  if (_errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        _errorMessage,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),
                      ),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
