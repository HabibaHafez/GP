// import 'package:flutter/material.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/Registeration/signup/user/user_signup.dart';
// import 'package:techmate/commponent/button.dart';
// import 'package:techmate/commponent/textField.dart';
//
// class hr_signup extends StatelessWidget {
//   final _userSignupKey = GlobalKey<UserSignupState>();
//   final _formKey = GlobalKey<FormState>(); // Define _formKey
//   static const routeName = 'hr sign up';
//   final TextEditingController _companyNameController = TextEditingController();
//   final TextEditingController _jobtitleController = TextEditingController();
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
//         padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 children: [
//                   SizedBox(height: 20),
//                   UserSignup(key: _userSignupKey),
//                   TextField_component(
//                     attribute: 'company name',
//                     controller: _companyNameController, // Pass the controller
//                   ),
//                   SizedBox(height: 20),
//                   TextField_component(
//                     attribute: 'job title',
//                     controller: _jobtitleController, // Pass the controller
//                   ),
//                   SizedBox(height: 30),
//                   ElevatedButton(
//                     onPressed: () {
//                       // Validate all fields together
//                       if (_formKey.currentState!.validate() &&
//                           _userSignupKey.currentState!.validate()) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ContinuedSignup.fromRecruiter(
//                               firstName: _userSignupKey.currentState!.firstName,
//                               lastName: _userSignupKey.currentState!.lastName,
//                               email: _userSignupKey.currentState!.email,
//                               nationalId:
//                               _userSignupKey.currentState!.nationalId,
//                               gender: _userSignupKey.currentState!.gender!,
//                               companyName: _companyNameController
//                                   .text, // Remove semicolon (;)
//                               jobtitle: _jobtitleController
//                                   .text, // Remove semicolon (;)
//                             ),
//                           ),
//                         );
//                       }
//                     },
//                     style: ElevatedButton.styleFrom(
//                       minimumSize: Size(400, 55),
//                       backgroundColor: Color.fromARGB(255, 48, 134, 232),
//                     ),
//                     child: Text(
//                       'Continue',
//                       style: TextStyle(
//                         fontSize: 20,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 10),
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

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/Registeration/signup/user/user_signup.dart';

class hr_signup extends StatelessWidget {
  final _userSignupKey = GlobalKey<UserSignupState>();
  final _formKey = GlobalKey<FormState>();
  static const routeName = 'hr sign up';
  final TextEditingController _companyNameController = TextEditingController();
  final TextEditingController _jobtitleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50, right: 30, left: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
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
                  TextFormField(
                    controller: _companyNameController,
                    decoration: InputDecoration(
                      labelText: 'Company Name',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter company name';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _jobtitleController,
                    decoration: InputDecoration(
                      labelText: 'Job Title',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue[800]!),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter job title';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate() &&
                            _userSignupKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ContinuedSignup.fromRecruiter(
                                    firstName:
                                    _userSignupKey.currentState!.firstName,
                                    lastName: _userSignupKey.currentState!.lastName,
                                    email: _userSignupKey.currentState!.email,
                                    nationalId:
                                    _userSignupKey.currentState!.nationalId,
                                    gender: _userSignupKey.currentState!.gender!,
                                    companyName: _companyNameController.text,
                                    jobtitle: _jobtitleController.text,
                                  ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        minimumSize: Size(double.infinity, 55),
                        backgroundColor: Color.fromARGB(255, 48, 134, 232),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      child: Text(
                        'Continue',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 4),
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
