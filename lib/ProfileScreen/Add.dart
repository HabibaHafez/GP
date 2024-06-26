import 'package:flutter/material.dart';

class AddExperienceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Experience', style: TextStyle(color: Colors.blue[800])),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            // Implement your form here to capture new experience details
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Title'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter a title';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Company'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Type'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Date'),
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Location'),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Process form data (e.g., save to database)
                    // Close the dialog
                    Navigator.of(context).pop();
                  },
                  child: Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
