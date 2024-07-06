import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/StudentUser/BottonNavigationBar/navbar.dart';
import 'package:techmate/services/profile/profileUpdateApiService.dart';
import 'package:techmate/services/profile/area_of_interest_api_service.dart'; // Import the new service
import 'profile.dart';

class AreaOfInterestScreen extends StatefulWidget {
  @override
  _AreaOfInterestScreenState  createState() => _AreaOfInterestScreenState();
}

class _AreaOfInterestScreenState extends State<AreaOfInterestScreen> {
  List<String> areasOfInterest = [];
  final ProfileUpdateApiService _apiService = ProfileUpdateApiService();
  final AreaOfInterestApiService _areaOfInterestApiService =
  AreaOfInterestApiService();
  final List<String> areaOfInterestsList = [
    'Data Analysis',
    'Software Engineer',
    'Dev Ops',
    'Data Science',
    'Data Engineer',
    'Web Development',
    'FrontEnd Development',
    'BackEnd Development',
    'Cloud Computing',
  ];

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
      if (profileData != null && profileData['student'] != null) {
        setState(() {
          areasOfInterest =
              profileData['student']['AreaOfInterest'].split(', ');
        });
      } else {
        print('Failed to load areas of interest.');
      }
    } else {
      print('Failed to get national ID.');
    }
  }

  void _openAddAreaOfInterestForm(BuildContext context,
      {String? areaToEdit, int? index}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AddAreaOfInterestDialog(
          availableAreas: areaOfInterestsList
              .where((area) => !areasOfInterest.contains(area))
              .toList(),
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
          content:
          Text('Are you sure you want to delete this area of interest?'),
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
      print(
          'Updating areas of interest with payload: $nationalId, $areasOfInterest, $action');
      bool success = await _areaOfInterestApiService.updateAreaOfInterest(
          nationalId, areasOfInterest, action);
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
                _openAddAreaOfInterestForm(context,
                    areaToEdit: areasOfInterest[index], index: index);
              },
              onDelete: () {
                _confirmDeleteAreaOfInterest(context, index);
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
          _openAddAreaOfInterestForm(context);
        },
        child: Icon(Icons.add, color: Colors.white),
        backgroundColor: Colors.blue[800],
      ),
    );
  }
}

class AddAreaOfInterestDialog extends StatefulWidget {
  final List<String> availableAreas;
  final void Function(String) onSave;
  final String? area;

  AddAreaOfInterestDialog(
      {required this.availableAreas, required this.onSave, this.area});

  @override
  _AddAreaOfInterestDialogState  createState() =>
      _AddAreaOfInterestDialogState();
}

class _AddAreaOfInterestDialogState extends State<AddAreaOfInterestDialog> {
  String? selectedArea;

  @override
  void initState() {
    super.initState();
    selectedArea = widget.area;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.area != null
          ? 'Edit Area of Interest'
          : 'Add New Area of Interest'),
      content: Container(
        width: MediaQuery.of(context).size.width * 0.8,
        height: MediaQuery.of(context).size.height * 0.6,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select an area of interest',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Theme.of(context).textTheme.titleLarge!.color,
              ),
            ),
            SizedBox(height: 8),
            Expanded(
              child: ListView.separated(
                itemCount: widget.availableAreas.length,
                separatorBuilder: (context, index) =>
                    Divider(), // Add a Divider between each area
                itemBuilder: (context, index) {
                  final area = widget.availableAreas[index];
                  final isSelected = area == selectedArea;

                  return ListTile(
                    tileColor:
                    isSelected ? Theme.of(context).highlightColor : null,
                    title: Text(
                      area,
                      style: TextStyle(
                        color: isSelected ? Colors.white : null,
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        selectedArea = area;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel'),
        ),
        ElevatedButton(
          onPressed: () {
            if (selectedArea != null) {
              widget.onSave(selectedArea!);
            }
          },
          child: Text('Save'),
        ),
      ],
    );
  }
}

class AreaOfInterestTile extends StatelessWidget {
  final String area;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  AreaOfInterestTile(
      {required this.area, required this.onEdit, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(area,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            // IconButton(
            //   icon: Icon(Icons.edit),
            //   onPressed: onEdit,
            // ),
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
