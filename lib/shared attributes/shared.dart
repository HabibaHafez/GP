import 'package:shared_preferences/shared_preferences.dart';

// Function to get National ID
Future<int?> getNationalId() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getInt('national_id');
}
