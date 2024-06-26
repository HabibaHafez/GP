import 'package:flutter/material.dart';
import 'profile.dart';
import '../Home/home.dart';
import 'package:home/Mentor/mentors.dart';
import 'package:home/navbar.dart';

class SkillsScreen extends StatefulWidget {
  @override
  _SkillsScreenState createState() => _SkillsScreenState();
}

class _SkillsScreenState extends State<SkillsScreen> {
  List<Map<String, String>> skills = [
    {'skill': 'Python', 'level': 'Advanced'},
    {'skill': 'Java', 'level': 'Intermediate'},
    {'skill': 'SQL', 'level': 'Advanced'},
    {'skill': 'Web Development', 'level': 'Intermediate'},
    {'skill': 'Machine Learning', 'level': 'Beginner'},
  ];

  void _openAddSkillForm(BuildContext context, {Map<String, String>? skillToEdit, int? index}) {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Skills', style: TextStyle(color: Colors.blue[800])),
        backgroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: skills.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(skills[index]['skill']!),
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
              skill: skills[index]['skill']!,
              level: skills[index]['level']!,
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
        currentIndex: 4, // Set the current index for the active item
        onTap: (index) {
          // Handle navigation based on index
          switch (index) {
            case 0:

              break;
            case 1:
            // Navigate to Internships screen (if necessary)
              break;
            case 2:
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
              break;
            case 3:
            // Navigate to Mentors screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MentorsScreen()),
              );
              break;
            case 4:
            // Navigate to Profile screen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ProfileScreen()),
              );
              break;
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddSkillForm(context);
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}

class AddSkillDialog extends StatefulWidget {
  final Map<String, String>? skill;
  final void Function(Map<String, String>) onSave;

  AddSkillDialog({this.skill, required this.onSave});

  @override
  _AddSkillDialogState createState() => _AddSkillDialogState();
}

class _AddSkillDialogState extends State<AddSkillDialog> {
  final _formKey = GlobalKey<FormState>();
  final _skillController = TextEditingController();
  final _levelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.skill != null) {
      _skillController.text = widget.skill!['skill']!;
      _levelController.text = widget.skill!['level']!;
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
              TextFormField(
                controller: _levelController,
                decoration: InputDecoration(labelText: 'Level'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newSkill = {
                      'skill': _skillController.text,
                      'level': _levelController.text,
                    };
                    widget.onSave(newSkill);
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
  final String level;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  SkillTile({required this.skill, required this.level, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(skill, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        subtitle: Text(level, style: TextStyle(color: Colors.grey[700])),
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
