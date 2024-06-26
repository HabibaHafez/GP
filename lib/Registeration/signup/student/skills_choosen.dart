import 'package:flutter/material.dart';
import 'package:techmate/HomeScreens/home_screen.dart';
import 'package:techmate/commponent/button.dart';

class ChooseSkills extends StatefulWidget {
  static const routeName = 'choose_skills';

  @override
  ChooseSkillsState get createState => ChooseSkillsState();
}

class ChooseSkillsState extends State<ChooseSkills> {
  List<String> selectedSkills = [];

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
            'Choose your skills',
            style:
                TextStyle(color: Color.fromARGB(255, 61, 60, 60), fontSize: 25),
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
                    buildChoiceChip('c++'),
                    buildChoiceChip('c'),
                    buildChoiceChip('python'),
                    buildChoiceChip('Data Analysis'),
                    buildChoiceChip('SQL'),
                    buildChoiceChip('Database Managment'),
                    buildChoiceChip('css'),
                    buildChoiceChip('Software Engineering'),
                    buildChoiceChip('java'),
                    buildChoiceChip('CyberSecurity'),
                    buildChoiceChip('java script'),
                    buildChoiceChip('dart'),
                    buildChoiceChip('flutter'),
                    buildChoiceChip('html'),
                    buildChoiceChip('Data Science'),
                    buildChoiceChip('front-end'),
                    buildChoiceChip('Back-end'),
                    buildChoiceChip('web-development'),
                    buildChoiceChip('machine learning'),
                  ],
                ),
                SizedBox(
                  height: 45,
                ),
                button_component(
                    usage: 'Done', routename: home_screen.routeName),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChoiceChip(String label) {
    final isSelected = selectedSkills.contains(label);

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
            selectedSkills.add(label);
          } else {
            selectedSkills.remove(label);
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
}
