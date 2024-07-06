import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/Registeration/signup/user/user_signup.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';
import 'package:techmate/shared%20attributes/shared.dart'; // Make sure this import is correct
import 'package:techmate/Registeration/signup/student/AreaOfInterestScreen.dart';

class mentor_signup extends StatelessWidget {
  final _userSignupKey = GlobalKey<UserSignupState>();
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _jobTitleController = TextEditingController();

  static const routeName = 'mentor sign up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
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
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  UserSignup(key: _userSignupKey),
                  SizedBox(height: 20),
                  TextField_component(
                    attribute: 'job title',
                    controller: _jobTitleController,
                  ),
                  SizedBox(height: 45),
                  ElevatedButton(
                    onPressed: () async {
                      if (_formKey.currentState!.validate() &&
                          _userSignupKey.currentState!.validate()) {
                        String? role = await getRole();
                        if (role != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ContinuedSignup.fromMentor(
                                firstName:
                                _userSignupKey.currentState!.firstName,
                                lastName: _userSignupKey.currentState!.lastName,
                                email: _userSignupKey.currentState!.email,
                                nationalId: _userSignupKey
                                    .currentState!.nationalId
                                    .toString(),
                                gender: _userSignupKey.currentState!.gender!,
                                jobtitle: _jobTitleController.text,
                                //role: role,
                              ),
                            ),
                          );
                        } else {
                          // Handle the case when role is null (e.g., show a message to the user)
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Role is not available')),
                          );
                        }
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => login_screen(),
                        ),
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
