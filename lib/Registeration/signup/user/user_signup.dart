import 'package:flutter/material.dart';
import 'package:techmate/Registeration/signup/user/ContinuedSignup.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/commponent/textField.dart';

class user_signup extends StatelessWidget {
  const user_signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Sign up',
          style: TextStyle(
              fontSize: 35,
              color: Colors.blue[800],
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        TextField_component(attribute: 'first name'),
        SizedBox(
          height: 20,
        ),
        TextField_component(attribute: 'last name'),
        SizedBox(
          height: 20,
        ),
        TextField_component(attribute: 'email'),
        SizedBox(
          height: 20,
        ),
        TextField_component(attribute: 'national id'),
        SizedBox(
          height: 20,
        ),
        TextField_component(attribute: 'address'),
        SizedBox(
          height: 20,
        ),
        DropdownButtonFormField<String>(
          hint: Text('Gender'),
          items: ['Female', 'Male'].map((String gender) {
            return DropdownMenuItem<String>(
              value: gender,
              child: Text(gender),
            );
          }).toList(),
          onChanged: (String? value) {},
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
