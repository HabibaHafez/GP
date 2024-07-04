import 'package:flutter/foundation.dart';

class BookingProvider extends ChangeNotifier {
  int? mentorId;
  int? studentId;

  void setMentorId(int id) {
    mentorId = id;
    notifyListeners();
  }

  void setStudentId(int id) {
    studentId = id;
    notifyListeners();
  }

  void updateStudentId(int id) {
    studentId = id;
    notifyListeners(); // Notify listeners to update the UI
  }
}
