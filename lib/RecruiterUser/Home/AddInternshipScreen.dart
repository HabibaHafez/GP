import 'package:flutter/material.dart';
import 'package:techmate/RecruiterUser/BottomNavigationBar/navbar.dart';
import 'package:techmate/services/RecruiterScreens/AddInternshipApiService.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:techmate/shared%20attributes/shared.dart';

class AddInternshipScreen extends StatefulWidget {
  const AddInternshipScreen({Key? key}) : super(key: key);

  @override
  _AddInternshipScreenState createState() => _AddInternshipScreenState();
}

class _AddInternshipScreenState extends State<AddInternshipScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _companyController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _paidController = TextEditingController();
  final TextEditingController _durationController = TextEditingController();
  final TextEditingController _requirementsController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();
  late int internId;

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _cityController.dispose();
    _dateController.dispose();
    _paidController.dispose();
    _durationController.dispose();
    _requirementsController.dispose();
    _descriptionController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _submitForm() async {
    //int? nationalId = await getNationalId();
    int national_id = 1234566304;
    if (national_id == null) {
      // Handle error: National ID not found
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('National ID not found. Please login again.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
      return;
    }

    // Create the request body
    final requestBody = {
      'InternID': internId,
      'InternTitle': _titleController.text,
      'CompanyName': _companyController.text,
      'InternReqNo': 'INT-2024-SD',
      "Link": _linkController.text,
      'Paid': _paidController.text.toLowerCase() == 'yes',
      'Date': _dateController.text,
      'Description': _descriptionController.text,
      'Duration': _durationController.text,
      'Requirements': _requirementsController.text,
      'City': _cityController.text,
      'Country': 'Egypt',
      'National_ID': national_id,
    };

    // Call the API service
    final success = await AddInternshipApiService.createInternship(requestBody);

    if (success) {
      // Internship created successfully
      // Example: Show a success message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Success'),
          content: Text('Internship created successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context); // Go back to the previous screen
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    } else {
      // Failed to create the internship
      // Example: Show an error message
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Error'),
          content: Text('Failed to create the internship.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Internship', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        leading: IconButton(
          icon: Icon(Icons.close, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          TextButton(
            onPressed: _submitForm,
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              decoration: InputDecoration(
                labelText: 'Intern ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _companyController,
              decoration: InputDecoration(
                labelText: 'Company Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _cityController,
              decoration: InputDecoration(
                labelText: 'City',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _dateController,
              decoration: InputDecoration(
                labelText: 'Date',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _paidController,
              decoration: InputDecoration(
                labelText: 'Paid (Yes/No)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _durationController,
              decoration: InputDecoration(
                labelText: 'Duration',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _requirementsController,
              maxLines: null, // Allow multiple lines of text
              decoration: InputDecoration(
                labelText: 'Requirements',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _descriptionController,
              maxLines: null, // Allow multiple lines of text
              decoration: InputDecoration(
                labelText: 'Description',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 12.0),
            TextFormField(
              controller: _linkController,
              maxLines: null, // Allow multiple lines of text
              decoration: InputDecoration(
                labelText: 'Form Link',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: RecruiterBottomNavBar(
        currentIndex: 0,
      ),
    );
  }
}
