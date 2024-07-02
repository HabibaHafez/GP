import 'package:flutter/material.dart';
import 'dart:io';
import 'package:file_picker/file_picker.dart';

class ApplyToInternshipScreen extends StatefulWidget {
  @override
  _ApplyToInternshipScreenState  createState() =>
      _ApplyToInternshipScreenState();
}

class _ApplyToInternshipScreenState extends State<ApplyToInternshipScreen> {
  List<bool> _isOpen = [true, true, true];
  File? _selectedFile;

  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _emailAddressController = TextEditingController();
  TextEditingController _coverLetterController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Apply to Internship',
          style: TextStyle(color: Colors.white),),
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              ExpansionPanelList(
                expansionCallback: (int index, bool isExpanded) {
                  setState(() {
                    _isOpen[index] = !isExpanded;
                  });
                },
                children: [
                  _buildContactInfoPanel(),
                  _buildResumePanel(),
                  _buildSummaryPanel(),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue[800],
                  minimumSize: Size(double.infinity, 40),
                ),
                child: Text(
                  'Submit Application',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: _canSubmit() ? _submitApplication : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionPanel _buildContactInfoPanel() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Contact Info'),
        );
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildTextField(_firstNameController, 'First name*'),
            _buildTextField(_lastNameController, 'Last name*'),
            _buildTextField(_phoneNumberController, 'Phone number*'),
            _buildTextField(_emailAddressController, 'Email address*'),
          ],
        ),
      ),
      isExpanded: _isOpen[0],
    );
  }

  ExpansionPanel _buildResumePanel() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Resume'),
        );
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                minimumSize: Size(double.infinity, 40),
                side: BorderSide(color: Colors.blue[800]!),
              ),
              child: Text(
                'Upload resume',
                style: TextStyle(color: Colors.blue[800]),
              ),
              onPressed: () async {
                FilePickerResult? result =
                    await FilePicker.platform.pickFiles();
                if (result != null) {
                  setState(() {
                    _selectedFile = File(result.files.single.path!);
                  });
                }
              },
            ),
            if (_selectedFile != null)
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  _selectedFile!.path.split('/').last,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
      isExpanded: _isOpen[1],
    );
  }

  ExpansionPanel _buildSummaryPanel() {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text('Summary'),
        );
      },
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Review your information before submitting:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            _buildSummaryText('First name', _firstNameController.text),
            _buildSummaryText('Last name', _lastNameController.text),
            _buildSummaryText('Phone number', _phoneNumberController.text),
            _buildSummaryText('Email address', _emailAddressController.text),
            if (_selectedFile != null)
              _buildSummaryText('Resume', _selectedFile!.path.split('/').last),
            _buildSummaryText('Cover letter', _coverLetterController.text),
          ],
        ),
      ),
      isExpanded: _isOpen[2],
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          border: OutlineInputBorder(),
        ),
        onChanged: (value) => setState(() {}),
      ),
    );
  }

  Widget _buildSummaryText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: Text(value),
          ),
        ],
      ),
    );
  }

  bool _canSubmit() {
    return _firstNameController.text.isNotEmpty &&
        _lastNameController.text.isNotEmpty &&
        _phoneNumberController.text.isNotEmpty &&
        _emailAddressController.text.isNotEmpty &&
        _selectedFile != null &&
        _coverLetterController.text.isNotEmpty;
  }

  void _submitApplication() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Application Submitted'),
        content: Text('Your application has been submitted successfully.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
