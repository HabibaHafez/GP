import 'package:flutter/material.dart';

class TextField_component extends StatelessWidget {
  final String attribute;
  final TextEditingController controller; // Add this line

  TextField_component({required this.attribute, required this.controller}); // Update the constructor

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'Enter your $attribute',
      ),
      style: TextStyle(color: Colors.black54.withOpacity(0.4)),
      onChanged: (value) {
        controller.text = value; // Assign the entered value to the controller
      },
    );
  }
}
