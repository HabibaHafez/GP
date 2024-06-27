import 'package:flutter/material.dart';
import 'package:techmate/BottonNavigationBar/navbar.dart';
import 'package:techmate/HomeScreens/home.dart';
import 'package:techmate/MentorScreen/mentors.dart';
import 'profile.dart';
import 'package:techmate/Notification/notification.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState  get createState => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();

  String firstName = 'Habiba';
  String lastName = 'Hafez';
  String email = 'habiba@example.com';
  String password = '********';
  String phoneNumber = '123456789';
  String country = 'Country';
  String city = 'City';
  String university = 'University';
  String faculty = 'Faculty';
  String level = '1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile',
          style: TextStyle(color: Colors.white) ),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.notifications,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextFormField('First Name', firstName, (value) {
                setState(() {
                  firstName = value;
                });
              }),
              buildTextFormField('Last Name', lastName, (value) {
                setState(() {
                  lastName = value;
                });
              }),
              buildTextFormField('Email', email, (value) {
                setState(() {
                  email = value;
                });
              }, keyboardType: TextInputType.emailAddress),
              buildTextFormField('Password', password, (value) {
                setState(() {
                  password = value;
                });
              }, obscureText: true),
              buildTextFormField('Phone Number', phoneNumber, (value) {
                setState(() {
                  phoneNumber = value;
                });
              }, keyboardType: TextInputType.phone),
              buildTextFormField('Country', country, (value) {
                setState(() {
                  country = value;
                });
              }),
              buildTextFormField('City', city, (value) {
                setState(() {
                  city = value;
                });
              }),
              buildTextFormField('University', university, (value) {
                setState(() {
                  university = value;
                });
              }),
              buildTextFormField('Faculty', faculty, (value) {
                setState(() {
                  faculty = value;
                });
              }),
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: 'Level'),
                value: level,
                onChanged: (String? newValue) {
                  setState(() {
                    level = newValue!;
                  });
                },
                items: <String>['1', '2', '3', '4', '5', 'Others']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              SizedBox(height: 20),ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Save the form
                    _formKey.currentState!.save();
                    Navigator.pop(context);
                  }
                },
                child: Text('Save'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.blue[800],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, String initialValue, Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        initialValue: initialValue,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
        onChanged: onChanged,
      ),
    );
  }
}
