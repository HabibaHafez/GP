import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/services/MentorScreens/profileApiService.dart';
import 'package:techmate/services/MentorScreens/area_of_interest_api_service.dart'; // Import the new service
import 'package:techmate/MentorUser/mentorhome.dart'; // Correct import for MentorHome

class AreaOfInterestScreen extends StatefulWidget {
  @override
  _AreaOfInterestScreenState createState() => _AreaOfInterestScreenState();
}

class _AreaOfInterestScreenState extends State<AreaOfInterestScreen> {
  List<String> areasOfInterest = [];
  final ProfileApiService _apiService = ProfileApiService();
  final AreaOfInterestApiService _areaOfInterestApiService = AreaOfInterestApiService();

  @override
  void initState() {
    super.initState();
    _loadAreasOfInterest();
  }

  Future<int?> getNationalId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getInt('national_id');
  }

  void _loadAreasOfInterest() async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      final profileData = await _apiService.getUserProfile(nationalId);
      if (profileData != null && profileData['mentor'] != null) {
        setState(() {
          areasOfInterest = profileData['mentor']['AreaOfInterest'].split(', ');
        });
      } else {
        print('Failed to load areas of interest.');
      }
    } else {
      print('Failed to get national ID.');
    }
  }

  void _openAddAreaOfInterestForm(BuildContext context, {String? areaToEdit, int? index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddAreaOfInterestDialog(
          area: areaToEdit,
          onSave: (newArea) {
            setState(() {
              if (index != null) {
                areasOfInterest[index] = newArea;
              } else {
                areasOfInterest.add(newArea);
              }
            });
            _updateAreasOfInterest('update');
            Navigator.of(context).pop();
          },
        );
      },
    );
  }

  void _deleteAreaOfInterest(int index) {
    setState(() {
      areasOfInterest.removeAt(index);
    });
    _updateAreasOfInterest('delete');
  }

  void _confirmDeleteAreaOfInterest(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this area of interest?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                _deleteAreaOfInterest(index);
                Navigator.of(context).pop();
              },
              child: Text('Delete'),
            ),
          ],
        );
      },
    );
  }

  void _updateAreasOfInterest(String action) async {
    int? nationalId = await getNationalId();
    if (nationalId != null) {
      print('Updating areas of interest with payload: $nationalId, $areasOfInterest, $action');
      bool success = await _areaOfInterestApiService.updateAreaOfInterest(nationalId, areasOfInterest, action);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to update areas of interest')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Areas of Interest', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: areasOfInterest.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(areasOfInterest[index]),
            direction: DismissDirection.endToStart,
            onDismissed: (direction) {
              _deleteAreaOfInterest(index);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Area of interest deleted')),
              );
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Icon(Icons.delete, color: Colors.white),
            ),
            child: AreaOfInterestTile(
              area: areasOfInterest[index],
              onEdit: () {
                _openAddAreaOfInterestForm(context, areaToEdit: areasOfInterest[index], index: index);
              },
              onDelete: () {
                _confirmDeleteAreaOfInterest(context, index);
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _openAddAreaOfInterestForm(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}

class AddAreaOfInterestDialog extends StatefulWidget {
  final String? area;
  final void Function(String) onSave;

  AddAreaOfInterestDialog({this.area, required this.onSave});

  @override
  _AddAreaOfInterestDialogState createState() => _AddAreaOfInterestDialogState();
}

class _AddAreaOfInterestDialogState extends State<AddAreaOfInterestDialog> {
  final _formKey = GlobalKey<FormState>();
  final _areaController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.area != null) {
      _areaController.text = widget.area!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.area == null ? 'Add New Area of Interest' : 'Edit Area of Interest'),
      content: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: _areaController,
                decoration: InputDecoration(labelText: 'Area of Interest'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an area of interest';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    widget.onSave(_areaController.text);
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

class AreaOfInterestTile extends StatelessWidget {
  final String area;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AreaOfInterestTile({required this.area, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(area, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
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



