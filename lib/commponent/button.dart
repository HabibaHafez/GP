// ignore_for_file: camel_case_types, must_be_immutable, use_key_in_widget_constructors

import 'package:flutter/material.dart';

class button_component extends StatelessWidget {
  String usage;
  String routename;
  button_component({required this.usage, required this.routename,  Future<Null> Function()? onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pushNamed(routename);
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(400, 55),
        backgroundColor: Color.fromARGB(255, 48, 134, 232),
      ),
      child: Text(
        usage,
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
