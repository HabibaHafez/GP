import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/Registeration/signup/user/user_signup.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';

class mentor_signup extends StatelessWidget {
  static const routeName = 'mentor sign up';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //toolbarHeight: 45,
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
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              user_signup(),
              TextField_component(attribute: 'job title'),
              SizedBox(
                height: 45,
              ),
              button_component(
                  usage: 'Continue', routename: ContinuedSignup.routeName),
              SizedBox(
                height: 10,
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
              )
            ]),
          ),
        ),
      ),
    );
  }
}
