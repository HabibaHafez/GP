import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/MentorScreens/MentorApis.dart';

class MentorEditProfileScreen extends StatefulWidget {
  @override
  _MentorEditProfileScreenState createState() => _MentorEditProfileScreenState();
}

class _MentorEditProfileScreenState extends State<MentorEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final ApiService apiService = ApiService();

  String firstName = '';
  String lastName = '';
  String email = '';
  String password = '';
  String? phoneNumber = '';
  String country = 'Country';
  String city = 'City';
  String jobTitle = '';
  String company = '';
  String price = '';
  String numberOfStudents = '';

  int? mentorId;

  @override
  void initState() {
    super.initState();
    getMentorId();
  }

  Future<void> getMentorId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('national_id');
    setState(() {
      mentorId = id;
    });
    if (mentorId != null) {
      _fetchProfileData();
    }
  }

  void _fetchProfileData() async {
    if (mentorId != null) {
      final profileData = await apiService.getMentorProfile(mentorId!);
      if (profileData != null) {
        setState(() {
          firstName = profileData['first_name'];
          lastName = profileData['last_name'];
          email = profileData['Email'];
          phoneNumber = profileData['PhoneNumber'];
          country = profileData['Country'] ?? 'Country';
          city = profileData['City'] ?? 'City';
          jobTitle = profileData['JobTitle'] ?? '';
          company = profileData['Company'] ?? '';
          price = profileData['Price'].toString() ?? '';
          numberOfStudents = profileData['No_of_Students'].toString() ?? '';
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

      if (mentorId != null) {
        final updatedProfileData = {
          'first_name': firstName,
          'last_name': lastName,
          'Email': email,
          'PhoneNumber': phoneNumber,
          'Country': country,
          'City': city,
          'JobTitle': jobTitle,
          'Company': company,
          'Price': int.parse(price),
          'No_of_Students': int.parse(numberOfStudents),
        };

        // Assuming you have an API to save the profile data
        await apiService.updateMentorProfile(mentorId!, updatedProfileData);
        Navigator.pop(context, true);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                buildTextFormField('Phone Number', phoneNumber ?? '', (value) {
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
                buildTextFormField('Job Title', jobTitle, (value) {
                  setState(() {
                    jobTitle = value;
                  });
                }),
                buildTextFormField('Company', company, (value) {
                  setState(() {
                    company = value;
                  });
                }),
                buildTextFormField('Price', price, (value) {
                  setState(() {
                    price = value;
                  });
                }, keyboardType: TextInputType.number),
                buildTextFormField('Number of Students', numberOfStudents, (value) {
                  setState(() {
                    numberOfStudents = value;
                  });
                }, keyboardType: TextInputType.number),
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
      ),
    );
  }

  Widget buildTextFormField(String labelText, String initialValue, Function(String) onChanged,
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
