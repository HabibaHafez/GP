// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/Notification/notification.dart';
// import 'package:techmate/services/profile/profileApiService.dart';
// import 'package:techmate/shared%20attributes/shared.dart';
//
// class EditProfileScreen extends StatefulWidget {
//   @override
//   _EditProfileScreenState  createState() => _EditProfileScreenState();
// }
//
// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final ProfileApiService _profileApiService = ProfileApiService();
//
//   String firstName = '';
//   String lastName = '';
//   String email = '';
//   String password = '';
//   String? phoneNumber = '';
//   String country = 'Country';
//   String city = 'City';
//   String university = 'University';
//   String faculty = 'Faculty';
//   String level = '1';
//
//   @override
//   void initState() {
//     super.initState();
//     _fetchProfileData();
//   }
//
//   void _fetchProfileData() async {
//     int? nationalId = await getNationalId();
//     if (nationalId != null) {
//       final profileData = await _profileApiService.getUserProfile(nationalId);
//
//       if (profileData != null) {
//         setState(() {
//           final user = profileData['user'];
//           firstName = user['first_name'];
//           lastName = user['last_name'];
//           email = user['Email'];
//           phoneNumber = user['PhoneNumber'];
//           country = user['Country'] ?? 'Country';
//           city = user['City'] ?? 'City';
//           university = user['University'] ?? 'University';
//           faculty = user['Faculty'] ?? 'Faculty';
//           level = user['Level'] ?? '1';
//         });
//       } else {
//         print('Failed to load user profile data.');
//       }
//     } else {
//       print('Failed to get national ID.');
//     }
//   }
//
//   void _saveProfile() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       int? nationalId = await getNationalId();
//       if (nationalId != null) {
//         Map<String, dynamic> updatedFields = {
//           'first_name': firstName,
//           'last_name': lastName,
//           'Email': email,
//           'Password': password,
//           'PhoneNumber': phoneNumber,
//           'Country': country,
//           'City': city,
//           'University': university,
//           'Faculty': faculty,
//           'Level': level,
//           'National_ID': nationalId,
//         };
//
//         bool success = await _profileApiService.updateProfile(updatedFields);
//
//         if (success) {
//           Navigator.pop(context);
//         } else {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text('Failed to update profile')),
//           );
//         }
//       }
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Edit Profile', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.notifications, color: Colors.white),
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => NotificationScreen()),
//               );
//             },
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: ListView(
//             children: [
//               buildTextFormField('First Name', firstName, (value) {
//                 setState(() {
//                   firstName = value;
//                 });
//               }),
//               buildTextFormField('Last Name', lastName, (value) {
//                 setState(() {
//                   lastName = value;
//                 });
//               }),
//               buildTextFormField('Email', email, (value) {
//                 setState(() {
//                   email = value;
//                 });
//               }, keyboardType: TextInputType.emailAddress),
//               buildTextFormField('Password', password, (value) {
//                 setState(() {
//                   password = value;
//                 });
//               }, obscureText: true),
//               // buildTextFormField('Phone Number', phoneNumber!, (value) {
//               //   setState(() {
//               //     phoneNumber = value;
//               //   });
//               // }, keyboardType: TextInputType.phone),
//               buildTextFormField('Country', country, (value) {
//                 setState(() {
//                   country = value;
//                 });
//               }),
//               buildTextFormField('City', city, (value) {
//                 setState(() {
//                   city = value;
//                 });
//               }),
//               buildTextFormField('University', university, (value) {
//                 setState(() {
//                   university = value;
//                 });
//               }),
//               buildTextFormField('Faculty', faculty, (value) {
//                 setState(() {
//                   faculty = value;
//                 });
//               }),
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(labelText: 'Level'),
//                 value: level,
//                 onChanged: (String? newValue) {
//                   setState(() {
//                     level = newValue!;
//                   });
//                 },
//                 items: <String>['1', '2', '3', '4', '5', 'Others']
//                     .map<DropdownMenuItem<String>>((String value) {
//                   return DropdownMenuItem<String>(
//                     value: value,
//                     child: Text(value),
//                   );
//                 }).toList(),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _saveProfile,
//                 child: Text('Save'),
//                 style: ElevatedButton.styleFrom(
//                   foregroundColor: Colors.white,
//                   backgroundColor: Colors.blue[800],
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(18.0),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 4,
//       ),
//     );
//   }
//
//   Widget buildTextFormField(
//       String labelText, String initialValue, Function(String) onChanged,
//       {TextInputType keyboardType = TextInputType.text,
//       bool obscureText = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(bottom: 16.0),
//       child: TextFormField(
//         initialValue: initialValue,
//         decoration: InputDecoration(
//           labelText: labelText,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(8),
//           ),
//         ),
//         keyboardType: keyboardType,
//         obscureText: obscureText,
//         onChanged: onChanged,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/Notification/notification.dart';
import 'package:techmate/services/profile/profileApiService.dart';
import 'package:techmate/shared%20attributes/shared.dart';
import 'package:techmate/services/profile/profileUpdateApiService.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  _EditProfileScreenState get createState => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final ProfileApiService _profileApiService = ProfileApiService();
  final ProfileUpdateApiService _profileUpdateApiService = ProfileUpdateApiService();

  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController universityController = TextEditingController();
  TextEditingController facultyController = TextEditingController();
  String level = '1';

  @override
  void initState() {
    super.initState();
    _fetchProfileData();
  }

  void _fetchProfileData() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      final profileData = await _profileUpdateApiService.getUserProfile(nationalId);

      if (profileData != null) {
        setState(() {
          final user = profileData['user'];
          final student = profileData['student'];
          firstNameController.text = user['first_name'] ?? '';
          lastNameController.text = user['last_name'] ?? '';
          emailController.text = user['Email'] ?? '';
          passwordController.text = user['Password'] ?? '';
          phoneNumberController.text = user['PhoneNumber'] ?? '';
          countryController.text = student['Country'] ?? 'Country';
          cityController.text = student['City'] ?? 'City';
          universityController.text = student['University'] ?? 'University';
          facultyController.text = student['Faculity'] ?? 'Faculty';
          level = student['Level'].toString();
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
          'Country': countryController.text,
          'City': cityController.text,
          'University': universityController.text,
          'Faculty': facultyController.text,
          'Level': level,
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
            icon: Icon(Icons.notifications, color: Colors.white),
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
              buildTextFormField('First Name', firstNameController),
              buildTextFormField('Last Name', lastNameController),
              buildTextFormField('Email', emailController, keyboardType: TextInputType.emailAddress),
              buildTextFormField('Password', passwordController, obscureText: true),
              buildTextFormField('Phone Number', phoneNumberController, keyboardType: TextInputType.phone),
              buildTextFormField('Country', countryController),
              buildTextFormField('City', cityController),
              buildTextFormField('University', universityController),
              buildTextFormField('Faculty', facultyController),
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
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
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

