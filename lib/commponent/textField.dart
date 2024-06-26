// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class TextField_component extends StatelessWidget {
  String attribute;

  TextField_component({required this.attribute});
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        hintText: 'enter your $attribute',
      ),
      style: TextStyle(color: Colors.black54..withOpacity(0.4)),
    );
  }
}
