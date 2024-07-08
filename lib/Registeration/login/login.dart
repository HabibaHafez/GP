import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/RecruiterUser/Home/recruiterHome.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/Registeration/signup/Registeration/Registeration.dart';
import 'package:techmate/services/registeration/login/loginApi.dart';
import 'package:techmate/MentorUser/mentorHome.dart';
import 'package:techmate/AdminUser/AdminHome.dart';

class login_screen extends StatefulWidget {
  static const routeName = 'sign in';

  @override
  _LoginScreenState  createState() => _LoginScreenState();
}

class _LoginScreenState extends State<login_screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(
              top: 10,
              bottom: 70,
              left: 25,
              right: 25), // Adjusted padding to shift content upward
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Image.asset(
                    'images/44.png', // Replace with your image asset path
                    width: 450, // Adjust width as needed
                  ),
                ),
                SizedBox(
                  height: 5, // Reduced height further to shift content upward
                ),
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800]!,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800]!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15, // Reduced height further to shift content upward
                ),
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800]!,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.blue[800]!,
                        width: 2.0,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25, // Reduced height further to shift content upward
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () async {
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

                        SharedPreferences prefs =
                        await SharedPreferences.getInstance();
                        await prefs.setInt('national_id', nationalId);
                        await prefs.setString('role', role);

                        if (role == 'student') {
                          Navigator.pushNamed(context, HomeScreen.routeName);
                        } else if (role == 'recruiter') {
                          Navigator.pushNamed(
                              context, RecruiterInternshipsScreen.routeName);
                        } else if (role == 'mentor') {
                          Navigator.pushNamed(context, MentorHome.routeName);
                        } else if (role == 'admin') {
                          Navigator.pushNamed(
                              context, AdminHomeScreen.routeName);
                        }
                      } else {
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
                      minimumSize: Size(double.infinity, 55),
                      backgroundColor: Color.fromARGB(255, 48, 134, 232),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Text(
                      'Sign in',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
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
