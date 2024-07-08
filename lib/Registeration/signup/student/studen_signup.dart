// import 'package:flutter/material.dart';
// import 'package:techmate/Registeration/login/login.dart';
// import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
// import 'package:techmate/Registeration/signup/user/user_signup.dart';
// import 'package:techmate/Registeration/validations/validator.dart';
// import 'package:techmate/shared%20attributes/shared.dart'; // Import ContinuedSignup screen
// import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';
//
// class StudentSignup extends StatefulWidget {
//   static const routeName = 'student_signup';
//
//   @override
//   _StudentSignupState  createState()=> _StudentSignupState();
// }
//
// class _StudentSignupState extends State<StudentSignup> {
//   final _formKey = GlobalKey<FormState>();
//   String? _selectedLevel;
//   final TextEditingController _countryController = TextEditingController();
//   String get address => _countryController.text.trim();
//   final _userSignupKey = GlobalKey<UserSignupState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student Sign Up'),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back),
//           onPressed: () {
//             Navigator.of(context).pop();
//           },
//         ),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
//         child: SingleChildScrollView(
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 20),
//                 Text(
//                   'Sign up',
//                   style: TextStyle(
//                     fontSize: 35,
//                     color: Colors.blue[800],
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//                 SizedBox(height: 20),
//                 UserSignup(key: _userSignupKey),
//                 TextFormField(
//                   controller: _countryController,
//                   decoration: InputDecoration(labelText: 'Country'),
//                 ),
//                 SizedBox(height: 20),
//                 DropdownButtonFormField<String>(
//                   value: _selectedLevel,
//                   hint: Text('Level'),
//                   items: ['1', '2', '3', '4'].map((String level) {
//                     return DropdownMenuItem<String>(
//                       value: level,
//                       child: Text(level),
//                     );
//                   }).toList(),
//                   onChanged: (String? value) {
//                     setState(() {
//                       _selectedLevel = value;
//                     });
//                   },
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () async {
//                     if (_formKey.currentState!.validate() &&
//                         _userSignupKey.currentState!.validate()) {
//                       String? role = await getRole();
//                       // Navigate to ContinuedSignup and pass the data
//                       if (role != null) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => ContinuedSignup(
//                               firstName: _userSignupKey.currentState!.firstName,
//                               lastName: _userSignupKey.currentState!.lastName,
//                               email: _userSignupKey.currentState!.email,
//                               nationalId:
//                               _userSignupKey.currentState!.nationalId,
//                               gender: _userSignupKey.currentState!.gender!,
//                               country: _countryController.text.trim(),
//                               level: _selectedLevel!,
//                               //role: role,
//                             ),
//                           ),
//                         );
//                       } else {
//                         // Handle the case when role is null (e.g., show a message to the user)
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('Role is not available')),
//                         );
//                       }
//                     }
//                   },
//                   style: ElevatedButton.styleFrom(
//                     minimumSize: Size(400, 55),
//                     backgroundColor: Color.fromARGB(255, 48, 134, 232),
//                   ),
//                   child: Text(
//                     'Continue',
//                     style: TextStyle(
//                       fontSize: 20,
//                       color: Colors.white,
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 10),
//                 TextButton(
//                   onPressed: () {
//                     Navigator.pushNamed(context, login_screen.routeName);
//                   },
//                   child: Text(
//                     "Already have an account? Login",
//                     style: TextStyle(fontSize: 16.0, color: Colors.blue[800]),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/Registeration/signup/user/user_signup.dart';
import 'package:techmate/Registeration/validations/validator.dart';
import 'package:techmate/shared%20attributes/shared.dart'; // Import ContinuedSignup screen
import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';

class StudentSignup extends StatefulWidget {
  static const routeName = 'student_signup';

  @override
  _StudentSignupState  createState() => _StudentSignupState();
}

class _StudentSignupState extends State<StudentSignup> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedLevel;
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _facultyController = TextEditingController();
  String get address => _countryController.text.trim();
  final _userSignupKey = GlobalKey<UserSignupState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 80, right: 25, left: 25),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  Center(
                    child: Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.blue[800],
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  UserSignup(key: _userSignupKey),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _countryController,
                    decoration: InputDecoration(
                      labelText: 'Country',
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
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _universityController,
                    decoration: InputDecoration(
                      labelText: 'University',
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
                    ),
                  ),
                  SizedBox(height: 20),
                  TextFormField(
                    controller: _facultyController,
                    decoration: InputDecoration(
                      labelText: 'Faculty',
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
                    ),
                  ),
                  SizedBox(height: 20),
                  DropdownButtonFormField<String>(
                    value: _selectedLevel,
                    hint: Text('Level'),
                    decoration: InputDecoration(
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
                    ),
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
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (_formKey.currentState!.validate() &&
                            _userSignupKey.currentState!.validate()) {
                          String? role = await getRole();
                          if (role != null) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ContinuedSignup(
                                  firstName:
                                  _userSignupKey.currentState!.firstName,
                                  lastName:
                                  _userSignupKey.currentState!.lastName,
                                  email: _userSignupKey.currentState!.email,
                                  nationalId:
                                  _userSignupKey.currentState!.nationalId,
                                  gender: _userSignupKey.currentState!.gender!,
                                  country: _countryController.text.trim(),
                                  university: _universityController.text.trim(),
                                  faculty: _facultyController.text.trim(),
                                  level: _selectedLevel!,
                                ),
                              ),
                            );
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Role is not available')),
                            );
                          }
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
                  SizedBox(height: 10),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, login_screen.routeName);
                      },
                      child: Text(
                        "Already have an account? Login",
                        style:
                        TextStyle(fontSize: 16.0, color: Colors.blue[800]),
                      ),
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
