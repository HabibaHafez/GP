import 'package:flutter/material.dart';
import 'package:techmate/RecruiterUser/BottomNavigationBar/navbar.dart';
import 'package:techmate/services/RecruiterScreens/getAllinternsforRecuiter.dart';
import 'package:techmate/services/RecruiterScreens/updateInternApiService.dart';

class RecruiterInternshipDetails extends StatefulWidget {
  final Internship internship;

  const RecruiterInternshipDetails({Key? key, required this.internship})
      : super(key: key);

  @override
  _RecruiterInternshipDetailsState createState() =>
      _RecruiterInternshipDetailsState();
}

class _RecruiterInternshipDetailsState
    extends State<RecruiterInternshipDetails> {
  late TextEditingController _titleController;
  late TextEditingController _companyController;
  late TextEditingController _locationController;
  late TextEditingController _dateController;
  late TextEditingController _durationController;
  late TextEditingController _descriptionController;
  late TextEditingController _requirementsController;
  late TextEditingController _linkController;
  late TextEditingController _paidController;
  late int internId;

  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: widget.internship.internTitle);
    _companyController =
        TextEditingController(text: widget.internship.companyName);
    _locationController = TextEditingController(
        text: '${widget.internship.city}, ${widget.internship.country}');
    _dateController = TextEditingController(text: widget.internship.date);
    _durationController =
        TextEditingController(text: widget.internship.duration);
    _descriptionController =
        TextEditingController(text: widget.internship.description);
    _requirementsController =
        TextEditingController(text: widget.internship.requirements);
    _linkController = TextEditingController(text: widget.internship.link);
    _paidController =
        TextEditingController(text: widget.internship.paid.toString());
    internId = widget.internship.internId;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _companyController.dispose();
    _locationController.dispose();
    _dateController.dispose();
    _durationController.dispose();
    _descriptionController.dispose();
    _requirementsController.dispose();
    _linkController.dispose();
    _paidController.dispose();
    super.dispose();
  }

  Future<void> _updateInternship() async {
    final locationParts = _locationController.text.split(', ');
    if (locationParts.length < 2) {
      // Handle invalid location input
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Invalid location format. Please use "City, Country" format.')));
      return;
    }

    final updatedInternship = Internship(
      internId: widget.internship.internId,
      internTitle: _titleController.text,
      companyName: _companyController.text,
      city: locationParts[0],
      country: locationParts[1],
      date: _dateController.text,
      duration: _durationController.text,
      paid: _paidController.text.toLowerCase() == 'true', // Convert to boolean
      description: _descriptionController.text,
      requirements: _requirementsController.text,
      link: _linkController.text,
      internReqNo: widget.internship.internReqNo,
      nationalId: widget.internship.nationalId,
    );

    try {
      final success =
      await UpdateInternshipApiService().updateInternship(updatedInternship);
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Internship updated successfully')));
        Navigator.pop(context, updatedInternship);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Failed to update internship')));
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error: $e')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Internship Details', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue[800],
        actions: [
          TextButton(
            onPressed: _updateInternship,
            child: Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Internship Title'),
            ),
            TextField(
              controller: _companyController,
              decoration: InputDecoration(labelText: 'Company Name'),
            ),
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            TextField(
              controller: _dateController,
              decoration: InputDecoration(labelText: 'Date'),
            ),
            TextField(
              controller: _durationController,
              decoration: InputDecoration(labelText: 'Duration'),
            ),
            TextField(
              controller: _paidController,
              decoration: InputDecoration(labelText: 'Paid (true/false)'),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            TextField(
              controller: _requirementsController,
              decoration: InputDecoration(labelText: 'Requirements'),
            ),
            TextField(
              controller: _linkController,
              decoration: InputDecoration(labelText: 'Link'),
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
