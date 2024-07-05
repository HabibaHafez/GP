import 'package:flutter/material.dart';
import 'package:techmate/RecruiterUser/BottomNavigationBar/navbar.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/services/RecruiterScreens/profileUpdateApi.dart';
import 'package:techmate/services/profile/profileApiService.dart';
import 'package:techmate/shared%20attributes/shared.dart';
import 'package:techmate/services/profile/profileUpdateApiService.dart';
import 'package:techmate/Registeration/Login/login.dart'; // Make sure to import your login screen
import 'package:shared_preferences/shared_preferences.dart'; // Import for SharedPreferences

class RecruiterProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<RecruiterProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final RecruiterProfileUpdateApiService _profileUpdateApiService = RecruiterProfileUpdateApiService();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController jobtitleController = TextEditingController();
  TextEditingController CompanyNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  void _fetchProfileData() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      final profileData = await _profileUpdateApiService.getUserProfile(nationalId);

      if (profileData != null) {
        setState(() {
          firstNameController.text = profileData['first_name'] ?? '';
          lastNameController.text = profileData['last_name'] ?? '';
          emailController.text = profileData['Email'] ?? '';
          passwordController.text = profileData['Password'] ?? '';
          phoneNumberController.text = profileData['PhoneNumber'] ?? '';
          jobtitleController.text = profileData['JobTitle'] ?? 'JobTitle';
          CompanyNameController.text = profileData['Comapany_Name'] ?? 'Company_Name';
        });
      } else {
        print('Failed to load user profile data.');
      }
    } else {
      print('Failed to get national ID.');
    }
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      int? nationalId = await getNationalId();
      if (nationalId != null) {
        Map<String, dynamic> updatedFields = {
          'first_name': firstNameController.text,
          'last_name': lastNameController.text,
          'Email': emailController.text,
          'Password': passwordController.text,
          'PhoneNumber': phoneNumberController.text,
          'JobTitle': jobtitleController.text,
          'Company_Name': CompanyNameController.text,
          'National_ID': nationalId,
        };

        bool success = await _profileUpdateApiService.updateProfile(updatedFields);

        if (success) {
          Navigator.pop(context);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Failed to update profile')),
          );
        }
      }
    }
  }

  void _logout() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => login_screen()),
          (Route<dynamic> route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.logout, color: Colors.white),
            onPressed: _logout,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildTextFormField('First Name', firstNameController),
              buildTextFormField('Last Name', lastNameController),
              buildTextFormField('Email', emailController, keyboardType: TextInputType.emailAddress),
              buildTextFormField('Password', passwordController, obscureText: true),
              buildTextFormField('Phone Number', phoneNumberController, keyboardType: TextInputType.phone),
              buildTextFormField('JobTitle', jobtitleController),
              buildTextFormField('Company_Name', CompanyNameController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _saveProfile,
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
      bottomNavigationBar: RecruiterBottomNavBar(
        currentIndex: 1,
      ),
    );
  }

  Widget buildTextFormField(String labelText, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: labelText,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        keyboardType: keyboardType,
        obscureText: obscureText,
      ),
    );
  }
}
