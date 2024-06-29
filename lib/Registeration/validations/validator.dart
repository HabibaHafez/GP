class Validator {
  static String? validateName(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    final nameExp = RegExp(r'^[A-Za-z]+$');
    if (!nameExp.hasMatch(value)) {
      return 'Please enter a valid name';
    }
    return null;
  }

  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    final emailExp =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailExp.hasMatch(value)) {
      return 'Please enter a valid email address';
    }
    return null;
  }

  static String? validateNationalId(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length != 10) {
      return 'National ID must be 11 digits';
    }
    final idExp = RegExp(r'^[0-9]+$');
    if (!idExp.hasMatch(value)) {
      return 'National ID must be numeric';
    }
    return null;
  }

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters long';
    }
    final passwordExp = RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$');
    if (!passwordExp.hasMatch(value)) {
      return 'Password must be a combination of letters and numbers';
    }
    return null;
  }

  static String? validateConfirmPassword(String value, String password) {
    if (value.isEmpty) {
      return 'This field cannot be empty';
    }
    if (value != password) {
      return 'Passwords do not match';
    }
    return null;
  }
}
