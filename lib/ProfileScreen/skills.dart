// import 'package:flutter/material.dart';
// import 'package:techmate/BottonNavigationBar/navbar.dart';
// import 'package:techmate/HomeScreens/home.dart';
// import 'package:techmate/MentorScreen/mentors.dart';
// import 'profile.dart';
//
// class SkillsScreen extends StatefulWidget {
//   @override
//   _SkillsScreenState   createState() => _SkillsScreenState();
// }
//
// class _SkillsScreenState extends State<SkillsScreen> {
//   List<Map<String, String>> skills = [
//     {'skill': 'Python'},
//     {'skill': 'Java'},
//     {'skill': 'SQL'},
//     {'skill': 'Web Development'},
//     {'skill': 'Machine Learning'},
//   ];
//
//   void _openAddSkillForm(BuildContext context,
//       {Map<String, String>? skillToEdit, int? index}) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AddSkillDialog(
//           skill: skillToEdit,
//           onSave: (newSkill) {
//             setState(() {
//               if (index != null) {
//                 skills[index] = newSkill;
//               } else {
//                 skills.add(newSkill);
//               }
//             });
//             Navigator.of(context).pop();
//           },
//         );
//       },
//     );
//   }
//
//   void _deleteSkill(int index) {
//     setState(() {
//       skills.removeAt(index);
//     });
//   }
//
//   void _confirmDeleteSkill(BuildContext context, int index) {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return AlertDialog(
//           title: Text('Confirm Deletion'),
//           content: Text('Are you sure you want to delete this skill?'),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.of(context).pop(),
//               child: Text('Cancel'),
//             ),
//             TextButton(
//               onPressed: () {
//                 _deleteSkill(index);
//                 Navigator.of(context).pop();
//               },
//               child: Text('Delete'),
//             ),
//           ],
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Skills', style: TextStyle(color: Colors.white)),
//         backgroundColor: Colors.blue[800],
//         leading: IconButton(
//           icon: Icon(
//             Icons.arrow_back,
//             color: Colors.white,
//           ),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView.builder(
//         padding: const EdgeInsets.all(16.0),
//         itemCount: skills.length,
//         itemBuilder: (context, index) {
//           return Dismissible(
//             key: Key(skills[index]['skill']!),
//             direction: DismissDirection.endToStart,
//             onDismissed: (direction) {
//               _deleteSkill(index);
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(content: Text('Skill deleted')),
//               );
//             },
//             background: Container(
//               color: Colors.red,
//               alignment: Alignment.centerRight,
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Icon(Icons.delete, color: Colors.white),
//             ),
//             child: SkillTile(
//               skill: skills[index]['skill']!,
//               // level: skills[index]['level']!,
//               onEdit: () {
//                 _openAddSkillForm(context,
//                     skillToEdit: skills[index], index: index);
//               },
//               onDelete: () {
//                 _confirmDeleteSkill(context, index);
//               },
//             ),
//           );
//         },
//       ),
//       bottomNavigationBar: BottomNavBar(
//         currentIndex: 4,
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           _openAddSkillForm(context);
//         },
//         child: Icon(Icons.add, color: Colors.white,),
//         backgroundColor: Colors.blue[800],
//       ),
//     );
//   }
// }
//
// class AddSkillDialog extends StatefulWidget {
//   final Map<String, String>? skill;
//   final void Function(Map<String, String>) onSave;
//
//   AddSkillDialog({this.skill, required this.onSave});
//
//   @override
//   _AddSkillDialogState   createState() => _AddSkillDialogState();
// }
//
// class _AddSkillDialogState extends State<AddSkillDialog> {
//   final _formKey = GlobalKey<FormState>();
//   final _skillController = TextEditingController();
//   final _levelController = TextEditingController();
//
//   @override
//   void initState() {
//     super.initState();
//     if (widget.skill != null) {
//       _skillController.text = widget.skill!['skill']!;
//       _levelController.text = widget.skill!['level']!;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return AlertDialog(
//       title: Text(widget.skill == null ? 'Add New Skill' : 'Edit Skill'),
//       content: SingleChildScrollView(
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               TextFormField(
//                 controller: _skillController,
//                 decoration: InputDecoration(labelText: 'Skill'),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter a skill';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _levelController,
//                 decoration: InputDecoration(labelText: 'Level'),
//               ),
//               SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final newSkill = {
//                       'skill': _skillController.text,
//                       'level': _levelController.text,
//                     };
//                     widget.onSave(newSkill);
//                   }
//                 },
//                 child: Text('Save'),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class SkillTile extends StatelessWidget {
//   final String skill;
//   final VoidCallback onEdit;
//   final VoidCallback onDelete;
//
//   SkillTile(
//       {required this.skill,
//         // required this.level,
//       required this.onEdit,
//       required this.onDelete});
//
//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       child: ListTile(
//         title: Text(skill,
//             style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//         // subtitle: Text(level, style: TextStyle(color: Colors.grey[700])),
//         trailing: Row(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             IconButton(
//               icon: Icon(Icons.edit),
//               onPressed: onEdit,
//             ),
//             IconButton(
//               icon: Icon(Icons.delete),
//               onPressed: onDelete,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/services/profile/profileUpdateApiService.dart';
import 'profile.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  List<String> skills = [];
  final ProfileUpdateApiService _apiService = ProfileUpdateApiService();

  @override
  void initState() {
    super.initState();
    _loadSkills();
  }

  void _loadSkills() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      final profileData = await _apiService.getUserProfile(nationalId);
      if (profileData != null && profileData['student'] != null) {
        setState(() {
          skills = profileData['student']['Skills'].split(', ');
        });
      } else {
        print('Failed to load skills.');
      }
    } else {
      print('Failed to get national ID.');
    }
  }

  void _openAddSkillForm(BuildContext context, {String? skillToEdit, int? index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddSkillDialog(
          skill: skillToEdit,
          onSave: (newSkill) {
            setState(() {
              if (index != null) {
                skills[index] = newSkill;
              } else {
                skills.add(newSkill);
              }
            });
            _updateSkills('update');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _deleteSkill(int index) {
    setState(() {
      skills.removeAt(index);
    });
    _updateSkills('delete');
  }


  void _confirmDeleteSkill(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this skill?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteSkill(index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _updateSkills(String action) async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      print('Updating skills with payload: $nationalId, $skills, $action');
      bool success = await _apiService.updateSkills(nationalId, skills, action);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update skills')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills', style: TextStyle(color: Colors.white)),
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
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(skills[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteSkill(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Skill deleted')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: SkillTile(
              skill: skills[index],
              onEdit: () {
                _openAddSkillForm(context, skillToEdit: skills[index], index: index);
              },
              onDelete: () {
                _confirmDeleteSkill(context, index);
              },
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: 4,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddSkillForm(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}

class AddSkillDialog extends StatefulWidget {
  final String? skill;
  final void Function(String) onSave;

  AddSkillDialog({this.skill, required this.onSave});

  @override
  _AddSkillDialogState createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  final _formKey = GlobalKey<FormState>();
  final _skillController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.skill != null) {
      _skillController.text = widget.skill!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.skill == null ? 'Add New Skill' : 'Edit Skill'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _skillController,
                decoration: InputDecoration(labelText: 'Skill'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a skill';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(_skillController.text);
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SkillTile extends StatelessWidget {
  final String skill;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  SkillTile({required this.skill, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(skill, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: onEdit,
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: onDelete,
            ),
          ],
        ),
      ),
    );
  }
}
