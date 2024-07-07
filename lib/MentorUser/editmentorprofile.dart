// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:techmate/services/MentorScreens/mentor_api_service.dart'; // Import the new service
//
// class MentorEditProfileScreen extends StatefulWidget {
//   final String firstName;
//   final String lastName;
//   final String email;
//   final String? phoneNumber;
//   final String jobTitle;
//   final String company;
//   final String price;
//   final String numberOfStudents;
//   final String password;
//
//   MentorEditProfileScreen({
//     required this.firstName,
//     required this.lastName,
//     required this.email,
//     required this.phoneNumber,
//     required this.jobTitle,
//     required this.company,
//     required this.price,
//     required this.numberOfStudents,
//     required this.password,
//   });
//
//   @override
//   _MentorEditProfileScreenState createState() => _MentorEditProfileScreenState();
// }
//
// class _MentorEditProfileScreenState extends State<MentorEditProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final MentorApiService apiService = MentorApiService();
//
//   late String firstName;
//   late String lastName;
//   late String email;
//   late String password;
//   late String? phoneNumber;
//   late String jobTitle;
//   late String company;
//   late String price;
//   late String numberOfStudents;
//
//   int? mentorId;
//
//   @override
//   void initState() {
//     super.initState();
//     getMentorId();
//     firstName = widget.firstName;
//     lastName = widget.lastName;
//     email = widget.email;
//     phoneNumber = widget.phoneNumber;
//     jobTitle = widget.jobTitle;
//     company = widget.company;
//     price = widget.price;
//     numberOfStudents = widget.numberOfStudents;
//     password = widget.password;
//   }
//
//   Future<void> getMentorId() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     int? id = prefs.getInt('national_id');
//     setState(() {
//       mentorId = id;
//     });
//   }
//
//   void _saveProfile() async {
//     if (_formKey.currentState!.validate()) {
//       _formKey.currentState!.save();
//
//       if (mentorId != null) {
//         final updatedProfileData = {
//           'National_ID': mentorId,
//           'first_name': firstName,
//           'last_name': lastName,
//           'Email': email,
//           'Password': password,
//           'PhoneNumber': phoneNumber,
//           'JobTitle': jobTitle,
//           'Company': company,
//           'Price': int.parse(price),
//           'No_of_Students': int.parse(numberOfStudents),
//         };
//
//         // Save the profile data
//         bool success = await apiService.updateMentorProfile(mentorId!, updatedProfileData);
//
//         if (success) {
//           Navigator.pop(context, true);
//         } else {
//           // Handle failure to update profile
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
//         title: Text('Edit Profile'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(height: 16), // Add some space before the first label
//                 buildTextFormField('First Name', firstName, (value) {
//                   setState(() {
//                     firstName = value;
//                   });
//                 }),
//                 buildTextFormField('Last Name', lastName, (value) {
//                   setState(() {
//                     lastName = value;
//                   });
//                 }),
//                 buildTextFormField('Email', email, (value) {
//                   setState(() {
//                     email = value;
//                   });
//                 }, keyboardType: TextInputType.emailAddress),
//                 buildTextFormField('Password', password, (value) {
//                   setState(() {
//                     password = value;
//                   });
//                 }, obscureText: true),
//                 buildTextFormField('Phone Number', phoneNumber ?? '', (value) {
//                   setState(() {
//                     phoneNumber = value;
//                   });
//                 }, keyboardType: TextInputType.phone),
//                 buildTextFormField('Job Title', jobTitle != 'null' ? jobTitle : '', (value) {
//                   setState(() {
//                     jobTitle = value;
//                   });
//                 }),
//                 buildTextFormField('Company', company != 'null' ? company : '', (value) {
//                   setState(() {
//                     company = value;
//                   });
//                 }),
//                 buildTextFormField('Price', price != 'null' ? price : '0', (value) {
//                   setState(() {
//                     price = value;
//                   });
//                 }, keyboardType: TextInputType.number),
//                 buildTextFormField('Number of Students', numberOfStudents != 'null' ? numberOfStudents : '0', (value) {
//                   setState(() {
//                     numberOfStudents = value;
//                   });
//                 }, keyboardType: TextInputType.number),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: _saveProfile,
//                   child: Text('Save'),
//                   style: ElevatedButton.styleFrom(
//                     foregroundColor: Colors.white,
//                     backgroundColor: Colors.blue[800],
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(18.0),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget buildTextFormField(String labelText, String initialValue, Function(String) onChanged,
//       {TextInputType keyboardType = TextInputType.text, bool obscureText = false}) {
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
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/MentorScreens/mentor_api_service.dart'; // Import the new service

class MentorEditProfileScreen extends StatefulWidget {
  final String firstName;
  final String lastName;
  final String email;
  final String? phoneNumber;
  final String jobTitle;
  final String company;
  final String price;
  final String numberOfStudents;
  final String password;

  MentorEditProfileScreen({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phoneNumber,
    required this.jobTitle,
    required this.company,
    required this.price,
    required this.numberOfStudents,
    required this.password,
  });

  @override
  _MentorEditProfileScreenState  createState() =>
      _MentorEditProfileScreenState();
}

class _MentorEditProfileScreenState extends State<MentorEditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final MentorApiService apiService = MentorApiService();

  late String firstName;
  late String lastName;
  late String email;
  late String password;
  late String? phoneNumber;
  late String jobTitle;
  late String company;
  late String price;
  late String numberOfStudents;

  int? mentorId;

  @override
  void initState() {
    super.initState();
    getMentorId();
    firstName = widget.firstName;
    lastName = widget.lastName;
    email = widget.email;
    phoneNumber = widget.phoneNumber;
    jobTitle = widget.jobTitle;
    company = widget.company;
    price = widget.price;
    numberOfStudents = widget.numberOfStudents;
    password = widget.password;
  }

  Future<void> getMentorId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int? id = prefs.getInt('national_id');
    setState(() {
      mentorId = id;
    });
  }

  void _saveProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (mentorId != null) {
        final updatedProfileData = {
          'National_ID': mentorId,
          'first_name': firstName,
          'last_name': lastName,
          'Email': email,
          'Password': password,
          'PhoneNumber': phoneNumber,
          'JobTitle': jobTitle,
          'Company': company,
          'Price': int.parse(price),
          'No_of_Students': int.parse(numberOfStudents),
        };

        // Save the profile data
        bool success =
        await apiService.updateMentorProfile(mentorId!, updatedProfileData);

        if (success) {
          Navigator.pop(context, true);
        } else {
          // Handle failure to update profile
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(80),
        child: AppBar(
          backgroundColor: Colors.blue[800],
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 20.0),
            child: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.white),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
          title: Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Edit Profile',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
              ),
            ),
          ),
          automaticallyImplyLeading: false,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Padding(
              padding:
              const EdgeInsets.symmetric(vertical: 8.0, horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 16), // Add some space before the first label
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
                  buildTextFormField('Phone Number', phoneNumber ?? '',
                          (value) {
                        setState(() {
                          phoneNumber = value;
                        });
                      }, keyboardType: TextInputType.phone),
                  buildTextFormField(
                      'Job Title', jobTitle != 'null' ? jobTitle : '', (value) {
                    setState(() {
                      jobTitle = value;
                    });
                  }),
                  buildTextFormField(
                      'Company', company != 'null' ? company : '', (value) {
                    setState(() {
                      company = value;
                    });
                  }),
                  buildTextFormField('Price', price != 'null' ? price : '0',
                          (value) {
                        setState(() {
                          price = value;
                        });
                      }, keyboardType: TextInputType.number),
                  buildTextFormField('Number of Students',
                      numberOfStudents != 'null' ? numberOfStudents : '0',
                          (value) {
                        setState(() {
                          numberOfStudents = value;
                        });
                      }, keyboardType: TextInputType.number),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _saveProfile,
                      child: Text('Save'),
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: Colors.blue[800],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField(
      String labelText, String initialValue, Function(String) onChanged,
      {TextInputType keyboardType = TextInputType.text,
        bool obscureText = false}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            labelText,
            style: TextStyle(
              color: Colors.blue[800],
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8), // Add some space between the label and the field
          TextFormField(
            initialValue: initialValue,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            keyboardType: keyboardType,
            obscureText: obscureText,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}
