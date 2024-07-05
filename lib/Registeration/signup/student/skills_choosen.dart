import 'package:flutter/material.dart';
import 'package:techmate/StudentUser/HomeScreens/home.dart';
import 'package:techmate/commponent/button.dart';
import 'package:techmate/services/registeration/signup/Student/studentApi.dart';

class ChooseAreaOfInterest extends StatefulWidget {
  static const routeName = 'choose_AreaOfInterst';
  final String firstName;
  final String lastName;
 

  final String email;
  final String nationalId;
  final String? address; // Nullable type for optional parameters
  final String? gender; // Nullable type for optional parameters
  final String? level; // Nullable type for optional parameters
  final String? password; // Nullable type for optional parameters

  ChooseAreaOfInterest({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.nationalId,
    this.address,
    this.gender,
    this.level,
    this.password,
  });

  @override
  ChooseAreaOfInterstState createState() => ChooseAreaOfInterstState();
}

class ChooseAreaOfInterstState extends State<ChooseAreaOfInterest> {
  String areaOfInterest = ''; // Initialize areaOfInterest
  String role='student';

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
                    buildChoiceChip('Data Analysis'),
                    buildChoiceChip('Software Engineer'),
                    buildChoiceChip('Dev Ops'),
                    buildChoiceChip('Data Science'),
                    buildChoiceChip('Data Engineer'),
                    buildChoiceChip('Web Developer'),
                    buildChoiceChip('Flutter Developer'),
                    buildChoiceChip('FrontEnd Developer'),
                    buildChoiceChip('BackEnd Developer'),
                    buildChoiceChip('Cloud Computing'),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                button_component(
                  usage: 'Done',
                  routename: HomeScreen.routeName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChoiceChip(String label) {
    final isSelected = areaOfInterest == label; // Check if label is selected

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
            areaOfInterest = label; // Set areaOfInterest to selected label
          } else {
            areaOfInterest = ''; // Reset or handle deselection logic
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

  @override
  void initState() {
    super.initState();
    _registerStudent();
  }

  void _registerStudent() async {
    try {
      await registerStudent(
        widget.firstName,
        widget.lastName,
        widget.email,
        widget.nationalId,
        widget.address!,
        widget.gender!,
        widget.level!, // Assuming you handle this correctly
        widget.password!,
        areaOfInterest,
       // role
        
        // Assuming you handle this correctly
      );
    } catch (e) {
      print('Error registering student: $e');
      // Handle error
    }
  }
}
