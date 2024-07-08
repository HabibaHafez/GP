import 'package:flutter/material.dart';
import 'package:techmate/Registeration/login/login.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/services/registeration/signup/Student/studentApi.dart';
import 'package:techmate/services/registeration/signup/Mentor/MentorApi.dart';
import 'package:techmate/shared attributes/shared.dart';

class ChooseAreaOfInterest extends StatefulWidget {
  static const routeName = 'choose_AreaOfInterest';
  final String firstName;
  final String lastName;
  final String email;
  final String nationalId;
  final String? gender;
  final String? level;
  final String? jobtitle;
  final String? password;
  final String? country;
  final String? faculty;
  final String? university;
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
    this.university,
    this.faculty,
  });

  @override
  ChooseAreaOfInterestState createState() => ChooseAreaOfInterestState();
}

class ChooseAreaOfInterestState extends State<ChooseAreaOfInterest> {
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
    });
  }

  Widget buildChoiceChip(String interest) {
    final bool isSelected = _interests.contains(interest);
    return ChoiceChip(
      label: Text(
        interest,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
      selected: isSelected,
      selectedColor: Colors.blue[800],
      backgroundColor: Colors.white,
      onSelected: (selected) {
        setState(() {
          if (selected) {
            _interests.add(interest);
          } else {
            _interests.remove(interest);
          }
        });
      },
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.blue[800]!),
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
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
                  'Discover your preferred tech fields',
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(bottom: 20, left: 10, right: 10, top: 10),
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.center,
              spacing: 8.0,
              runSpacing: 10.0,
              children: [
                buildChoiceChip(' Web Development '),
                buildChoiceChip(' Software Engineering '),
                buildChoiceChip(' Data Science '),
                buildChoiceChip(' Data Analysis '),
                buildChoiceChip(' UI/UX Design '),
                buildChoiceChip(' Mobile App Development '),
                buildChoiceChip(' Blockchain '),
                buildChoiceChip(' Machine Learning '),
                buildChoiceChip(' Cybersecurity '),
                buildChoiceChip(' Internet of Things '),
                buildChoiceChip(' Networking '),
                buildChoiceChip(' Game Development '),
                buildChoiceChip(' Cloud Computing '),
                buildChoiceChip(' Database Management '),
                buildChoiceChip(' Robotics '),
                buildChoiceChip(' Artificial Intelligence '),
              ],
            ),
            SizedBox(height: 15),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  padding: EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                onPressed: _isLoading
                    ? null
                    : () async {
                  setState(() {
                    _isLoading = true;
                    _errorMessage = '';
                  });
                  try {
                    bool isRegistered = false;
                    String interestsString = _interests.join(',');

                    if (_role == 'student') {
                      isRegistered = await registerStudent(
                        widget.firstName,
                        widget.lastName,
                        widget.email,
                        widget.nationalId,
                        widget.country!,
                        widget.gender!,
                        widget.level!,
                        widget.password!,
                        widget.faculty!,
                        widget.university!,
                        interestsString,
                      );
                    } else if (_role == 'mentor') {
                      isRegistered = await registerMentor(
                        widget.firstName,
                        widget.lastName,
                        widget.email,
                        widget.nationalId,
                        widget.gender!,
                        widget.jobtitle!,
                        widget.password!,
                        interestsString,
                      );
                    }

                    if (isRegistered) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => login_screen()),
                      );
                    } else {
                      setState(() {
                        _errorMessage =
                        'Registration failed. Please try again.';
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
                },
                child: _isLoading
                    ? CircularProgressIndicator(
                  color: Colors.white,
                )
                    : Text(
                  'Done',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            if (_errorMessage.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
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
    );
  }
}
