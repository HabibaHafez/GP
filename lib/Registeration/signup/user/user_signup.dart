import 'package:flutter/material.dart';
import 'package:techmate/Registeration/validations/validator.dart';

class UserSignup extends StatefulWidget {
  const UserSignup({super.key});

  @override
  UserSignupState  createState() => UserSignupState();
}

class UserSignupState extends State<UserSignup> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _nationalIdController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  String? _selectedGender;

  String get firstName => _firstNameController.text.trim();
  String get lastName => _lastNameController.text.trim();
  String get email => _emailController.text.trim();
  String get nationalId => _nationalIdController.text.trim();
  String get address => _addressController.text.trim();
  String? get gender => _selectedGender;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            controller: _firstNameController,
            decoration: InputDecoration(labelText: 'First Name'),
            validator: (value) => Validator.validateName(value!),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _lastNameController,
            decoration: InputDecoration(labelText: 'Last Name'),
            validator: (value) => Validator.validateName(value!),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(labelText: 'Email'),
            validator: (value) => Validator.validateEmail(value!),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _nationalIdController,
            decoration: InputDecoration(labelText: 'National ID'),
            validator: (value) => Validator.validateNationalId(value!),
          ),
          SizedBox(height: 20),
          TextFormField(
            controller: _addressController,
            decoration: InputDecoration(labelText: 'Address'),
          ),
          SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: _selectedGender,
            hint: Text('Gender'),
            items: ['Female', 'Male'].map((String gender) {
              return DropdownMenuItem<String>(
                value: gender,
                child: Text(gender),
              );
            }).toList(),
            onChanged: (String? value) {
              setState(() {
                _selectedGender = value;
              });
            },
            validator: (value) {
              if (value == null) {
                return 'Please select a gender';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  bool validate() {
    return _formKey.currentState!.validate();
  }
}
