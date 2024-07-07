import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/Registeration/signup/Registeration/Registeration.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';
import 'package:techmate/services/registeration/login/loginApi.dart';
import 'package:techmate/MentorUser/mentorHome.dart'; // Import mentor home screen
import 'package:techmate/AdminUser/AdminHome.dart';
import 'package:flutter/services.dart'; // Import for SystemNavigator

class login_screen extends StatefulWidget {
  static const routeName = 'sign in';

  @override
  _login_screenState createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool loggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              // Close the app and return to the phone's home screen
              SystemNavigator.pop();
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
                  attribute: 'email',
                  controller: _emailController,
                ),
                SizedBox(
                  height: 35,
                ),
                TextField_component(
                  attribute: 'password',
                  controller: _passwordController,
                ),
                SizedBox(
                  height: 50,
                ),
                ElevatedButton(
                  onPressed: () async {
                    // Call your login API
                    Map<String, dynamic> response = await _apiService.login(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );

                    print('API Response: $response');

                    if (response['success']) {
                      int nationalId = response['National_ID'];
                      String role = response['role'];
                      print('National ID: $nationalId');
                      print('Role: $role');

                      setState(() {
                        loggedIn = true;
                      });

                      // Save National ID using SharedPreferences
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      await prefs.setInt('national_id', nationalId);
                      await prefs.setString('role', role);

                      // Debug print statements
                      print('Navigating to role-specific home screen');

                      if (role == 'student') {
                        print('Navigating to Student Home Screen');
                        Navigator.pushNamed(context, HomeScreen.routeName);
                      } else if (role == 'recruiter') {
                        print('Navigating to Recruiter Home Screen');
                        Navigator.pushNamed(
                            context, RecruiterInternshipsScreen.routeName);
                      } else if (role == 'mentor') {
                        print('Navigating to Mentor Home Screen');
                        Navigator.pushNamed(context, MentorHome.routeName); // Ensure this route is defined
                      } else if (role == 'admin'){
                        print('Navigating to Admin Home Screen');
                        Navigator.pushNamed(context, AdminHomeScreen.routeName);
                      }
                    } else {
                      print('Login failed');
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text(response['message'] ??
                              'Invalid email or password. Please try again.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
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
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Registeration()),
                    );
                  },
                  child: Text(
                    "Don't have an account? Register",
                    style: TextStyle(
                        fontSize: 16.0,
                        color: const Color.fromRGBO(21, 101, 192, 1)),
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
