import 'package:shared_preferences/shared_preferences.dart';

// Function to get National ID
Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}

Future<String?> getRole() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('role');
}

// Function to get National ID as String
Future<String?> getNationalIdString() async {
  int? id = await getNationalId();
  return id?.toString();
}

Future<int?> _getSenderId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final id = prefs.getInt('national_id');
  return id;
}
