// import 'dart:async';
//
// import 'package:flutter/material.dart';
// import 'package:techmate/ProfileScreen/area_of_interest.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';
// import 'package:techmate/Registeration/validations/validator.dart';
// import 'package:techmate/services/registeration/signup/Mentor/MentorApi.dart';
// import 'package:techmate/services/registeration/signup/Student/studentApi.dart';
// import 'package:techmate/services/registeration/signup/Recruiter/RecruiterApi.dart';
// import 'package:techmate/shared%20attributes/shared.dart';
//
// class ContinuedSignup extends StatefulWidget {
//   static const routeName = 'ContinuedSignup';
//
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String nationalId;
//   final String? country; // Nullable type for optional parameters
//   final String? gender; // Nullable type for optional parameters
//   final String? level; // Nullable type for optional parameters
//   final String? jobtitle; // Nullable type for optional parameters
//   final String? companyName;
//
//   ContinuedSignup({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.nationalId,
//     this.country,
//     this.gender,
//     this.level,
//     this.jobtitle,
//     this.companyName,
//   });
//
//   factory ContinuedSignup.fromStudent({
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String nationalId,
//     required String country,
//     required String gender,
//     required String level,
//   }) {
//     return ContinuedSignup(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       nationalId: nationalId,
//       country: country,
//       gender: gender,
//       level: level,
//     );
//   }
//
//   factory ContinuedSignup.fromMentor({
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String nationalId,
//     String? gender,
//     required String jobtitle,
//   }) {
//     return ContinuedSignup(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       nationalId: nationalId,
//       gender: gender,
//       jobtitle: jobtitle,
//     );
//   }
//
//   factory ContinuedSignup.fromRecruiter({
//     required String firstName,
//     required String lastName,
//     required String email,
//     required String nationalId,
//     String? gender,
//     required String companyName,
//     required String jobtitle,
//   }) {
//     return ContinuedSignup(
//       firstName: firstName,
//       lastName: lastName,
//       email: email,
//       nationalId: nationalId,
//       gender: gender,
//       companyName: companyName,
//       jobtitle: jobtitle,
//     );
//   }
//
//   @override
//   _ContinuedSignupState  createState() => _ContinuedSignupState();
// }
//
// class _ContinuedSignupState extends State<ContinuedSignup> {
//   final _formKey = GlobalKey<FormState>();
//   final _passwordController = TextEditingController();
//   final _confirmPasswordController = TextEditingController();
//   bool _isLoading = false;
//   String _errorMessage = '';
//   String? _role;
//
//   @override
//   void initState() {
//     super.initState();
//     _initializeRole();
//   }
//
//   Future<void> _initializeRole() async {
//     final role = await getRole();
//     setState(() {
//       _role = role;
//       print('role is $_role');
//     });
//   }
//
//   void _registerUser() async {
//     if (_formKey.currentState!.validate()) {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = '';
//       });
//
//       try {
//         if (_role == 'recruiter') {
//           bool isRegistered = await registerRecruiter(
//             widget.firstName,
//             widget.lastName,
//             widget.email,
//             widget.nationalId,
//             widget.gender!,
//             widget.companyName!,
//             widget.jobtitle!,
//             _passwordController.text,
//           );
//
//           if (isRegistered) {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => login_screen()),
//             );
//           } else {
//             setState(() {
//               _errorMessage = 'Registration failed. Please try again.';
//             });
//           }
//         } else if (_role == 'mentor' || _role == 'student') {
//           Navigator.push(
//             context,
//             MaterialPageRoute(
//               builder: (context) => ChooseAreaOfInterest(
//                 firstName: widget.firstName,
//                 lastName: widget.lastName,
//                 email: widget.email,
//                 nationalId: widget.nationalId,
//                 gender: widget.gender!,
//                 country: widget.country,
//                 level: widget.level,
//                 jobtitle: widget.jobtitle,
//                 password: _passwordController.text,
//               ),
//             ),
//           );
//         }
//       } catch (e) {
//         setState(() {
//           _errorMessage = e.toString();
//         });
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Padding(
//           padding: const EdgeInsets.only(top: 30, left: 15),
//           child: IconButton(
//             icon: Icon(Icons.arrow_back),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 35),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   Text(
//                     'Continue',
//                     style: TextStyle(
//                       fontSize: 35,
//                       color: Colors.blue[800],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     controller: _passwordController,
//                     decoration: InputDecoration(labelText: 'Password'),
//                     obscureText: true,
//                     validator: (value) => Validator.validatePassword(value!),
//                   ),
//                   SizedBox(height: 30),
//                   TextFormField(
//                     controller: _confirmPasswordController,
//                     decoration: InputDecoration(labelText: 'Confirm Password'),
//                     obscureText: true,
//                     validator: (value) => Validator.validateConfirmPassword(
//                       value!,
//                       _passwordController.text,
//                     ),
//                   ),
//                   SizedBox(height: 80),
//                   _isLoading
//                       ? CircularProgressIndicator()
//                       : _role == null
//                       ? CircularProgressIndicator()
//                       : ElevatedButton(
//                     onPressed: _registerUser,
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(400, 55),
//                       backgroundColor:
//                       Color.fromARGB(255, 48, 134, 232),
//                     ),
//                     child: Text(
//                       _role == 'recruiter' ? 'Sign Up' : 'Continue',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   if (_errorMessage.isNotEmpty)
//                     Padding(
//                       padding: const EdgeInsets.symmetric(vertical: 10),
//                       child: Text(
//                         _errorMessage,
//                         style: TextStyle(
//                           color: Colors.red,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                   TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => login_screen()),
//                       );
//                     },
//                     child: Text(
//                       "Already have an account? Login",
//                       style: TextStyle(fontSize: 16.0, color: Colors.blue[800]),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'dart:async';
import 'package:flutter/material.dart';
import 'package:techmate/ProfileScreen/area_of_interest.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';
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
  final String? country; // Nullable type for optional parameters
  final String? gender; // Nullable type for optional parameters
  final String? level; // Nullable type for optional parameters
  final String? jobtitle; // Nullable type for optional parameters
  final String? companyName;
  final String? university;
  final String? faculty;

  ContinuedSignup({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nationalId,
    this.country,
    this.gender,
    this.level,
    this.jobtitle,
    this.companyName,
    this.university,
    this.faculty,
  });

  factory ContinuedSignup.fromStudent({
    required String firstName,
    required String lastName,
    required String email,
    required String nationalId,
    required String country,
    required String gender,
    required String level,
    required String university,
    required String faculty,
  }) {
    return ContinuedSignup(
      firstName: firstName,
      lastName: lastName,
      email: email,
      nationalId: nationalId,
      country: country,
      gender: gender,
      level: level,
      university: university,
      faculty: faculty,
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
  _ContinuedSignupState  createState() => _ContinuedSignupState();
}

class _ContinuedSignupState extends State<ContinuedSignup> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _isLoading = false;
  String _errorMessage = '';
  String? _role;
  bool _passwordVisible = false;
  bool _ConfirmPasswordVisible = false;

  @override
  void initState() {
    super.initState();
    _initializeRole();
  }

  Future<void> _initializeRole() async {
    final role = await getRole();
    setState(() {
      _role = role;
    });
  }

  void _registerUser() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
        _errorMessage = '';
      });

      try {
        if (_role == 'recruiter') {
          bool isRegistered = await registerRecruiter(
            widget.firstName,
            widget.lastName,
            widget.email,
            widget.nationalId,
            widget.gender!,
            widget.companyName!,
            widget.jobtitle!,
            _passwordController.text,
          );

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
        } else if (_role == 'mentor' || _role == 'student') {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChooseAreaOfInterest(
                firstName: widget.firstName,
                lastName: widget.lastName,
                email: widget.email,
                nationalId: widget.nationalId,
                gender: widget.gender!,
                country: widget.country,
                level: widget.level,
                jobtitle: widget.jobtitle,
                password: _passwordController.text,
                university: widget.university,
                faculty: widget.faculty,
              ),
            ),
          );
        }
      } catch (e) {
        setState(() {
          _errorMessage = e.toString();
        });
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
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
                    'Continue',
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.blue[800],
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _passwordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue[800],
                        ),
                        onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_passwordVisible,
                    validator: (value) => Validator.validatePassword(value!),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: InputDecoration(
                      labelText: 'Confirm Password',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(color: Colors.blue[800]!, width: 2.0),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _ConfirmPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Colors.blue[800],
                        ),
                        onPressed: () {
                          setState(() {
                            _ConfirmPasswordVisible = !_ConfirmPasswordVisible;
                          });
                        },
                      ),
                    ),
                    obscureText: !_ConfirmPasswordVisible,
                    validator: (value) => Validator.validateConfirmPassword(
                      value!,
                      _confirmPasswordController.text,
                    ),
                  ),
                  SizedBox(height: 80),
                  _isLoading
                      ? CircularProgressIndicator()
                      : _role == null
                      ? CircularProgressIndicator()
                      : ElevatedButton(
                    onPressed: _registerUser,
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(400, 55),
                      backgroundColor:
                      Color.fromARGB(255, 48, 134, 232),
                    ),
                    child: Text(
                      _role == 'recruiter' ? 'Sign Up' : 'Continue',
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
