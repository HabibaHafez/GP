import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/services/registeration/signup/Student/studentApi.dart';
import 'package:techmate/services/registeration/signup/Mentor/MentorApi.dart';
import 'package:techmate/shared%20attributes/shared.dart';

class ChooseAreaOfInterest extends StatefulWidget {
  static const routeName = 'choose_AreaOfInterst';
  final String firstName;
  final String lastName;
  final String email;
  final String nationalId; // Nullable type for optional parameters
  final String? gender; // Nullable type for optional parameters
  final String? level; // Nullable type for optional parameters
  final String? jobtitle; // Nullable type for optional parameters
  final String? password;
  final String? country;
  final List<String>? interests;

  ChooseAreaOfInterest({
    required this.firstName,
    required this.lastName,
    required this.email,
    this.country,
    required this.nationalId,
    this.gender,
    this.level,
    this.jobtitle,
    this.interests,
    this.password,
  });

  @override
  ChooseAreaOfInterestState  createState() => ChooseAreaOfInterestState();
}

class ChooseAreaOfInterestState extends State<ChooseAreaOfInterest> {
  String areaOfInterest = ''; // Initialize areaOfInterest
  bool _isLoading = false;
  String _errorMessage = '';
  List<String> _interests = [];
  String? _role;

  @override
  void initState() {
    super.initState();
    _initializeRole();
  }

  Future<void> _initializeRole() async {
    final role = await getRole();
    setState(() {
      _role = role;
      print('role==$_role');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leading: Padding(
          padding: const EdgeInsets.only(top: 40, left: 15),
          child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 40, left: 0),
          child: Text(
            'Choose your Tracks',
            style: TextStyle(
              color: Color.fromARGB(255, 61, 60, 60),
              fontSize: 25,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 35),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: [
                    buildChoiceChip(' Data Analysis'),
                    buildChoiceChip(' Software Engineer'),
                    buildChoiceChip(' Dev Ops'),
                    buildChoiceChip(' Data Science'),
                    buildChoiceChip(' Data Engineer'),
                    buildChoiceChip(' Web Developer'),
                    buildChoiceChip(' Flutter Developer'),
                    buildChoiceChip(' FrontEnd Developer'),
                    buildChoiceChip(' BackEnd Developer'),
                    buildChoiceChip(' Cloud Computing'),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                _isLoading
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                  onPressed: _registerUser,
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(400, 55),
                    backgroundColor: Color.fromARGB(255, 48, 134, 232),
                  ),
                  child: Text(
                    'Done',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                if (_errorMessage.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      _errorMessage,
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 16,
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

  Widget buildChoiceChip(String label) {
    final isSelected = _interests.contains(label); // Check if label is selected
    print('role is$_role');

    return ChoiceChip(
      label: Text(
        label,
        style: TextStyle(
          fontSize: isSelected ? 18.0 : 16.0,
          fontWeight: FontWeight.bold,
        ),
      ),
      selected: isSelected,
      onSelected: (bool selected) {
        setState(() {
          if (selected) {
            _interests.add(label); // Add to interests list
          } else {
            _interests.remove(label); // Remove from interests list
          }
        });
      },
      selectedColor: Colors.blue[800],
      labelStyle: TextStyle(color: Colors.white),
      backgroundColor: Color.fromARGB(255, 61, 60, 60),
      elevation: isSelected ? 4.0 : 2.0,
      padding: EdgeInsets.symmetric(horizontal: 16.0),
    );
  }

  Future<void> _registerUser() async {
    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      bool isRegistered = false;
      String interestsString = _interests.join(',');

      print('Role: $_role');
      print('Interests: $interestsString');

      if (_role == 'student') {
        print('Registering student...');
        isRegistered = await registerStudent(
          widget.firstName,
          widget.lastName,
          widget.email,
          widget.nationalId,
          widget.country!,
          widget.gender!,
          widget.level!,
          widget.password!,
          interestsString, // Pass the comma-separated string
        );
      } else if (_role == 'mentor') {
        print('Registering mentor...');
        isRegistered = await registerMentor(
          widget.firstName,
          widget.lastName,
          widget.email,
          widget.nationalId,
          widget.gender!,
          widget.jobtitle!,
          widget.password!,
          interestsString, // Pass the comma-separated string
        );
      }

      if (isRegistered) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => login_screen()),
        );
      } else {
        setState(() {
          _errorMessage = 'Registration failed. Please try again.';
        });
      }
    } catch (error) {
      setState(() {
        _errorMessage = 'Error: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }
}
