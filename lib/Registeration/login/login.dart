import 'package:flutter/material.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/Registeration/signup/Registeration/Registeration.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';
import 'package:techmate/services/registeration/login/loginApi.dart';

class login_screen extends StatefulWidget {
  static const routeName = 'sign in';

  @override
  _login_screenState get createState => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final ApiService _apiService = ApiService();

  bool loggedIn = false; // Variable to store login status
  String? nationalId; // Variable to store national ID

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(top: 20, left: 25),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
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
                button_component(
                  usage: 'Sign in',
                  onPressed: () async {
                    // Call your login API
                    Map<String, dynamic> response = await _apiService.login(
                      _emailController.text.trim(),
                      _passwordController.text.trim(),
                    );

                    if (response['success']) {
                      // Login successful, extract national ID
                      nationalId = response['nationalId'];

                      setState(() {
                        loggedIn = true;
                      });

                      Navigator.pushNamed(context, HomeScreen.routeName);
                    } else {
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: Text('Login Failed'),
                          content: Text(
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
                  routename: HomeScreen.routeName,
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
