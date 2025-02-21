class Validators {
  static String? validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return "Email cannot be empty";
    }
    const emailRegex = r'^[^@\s]+@[^@\s]+\.[^@\s]+$';
    if (!RegExp(emailRegex).hasMatch(email)) {
      return "Please enter a valid email address";
    }
    return null;
  }

  static String? validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return "Password cannot be empty";
    }
    if (password.length < 8) {
      return "Password must be at least 6 characters long";
    }
    return null;
  }

  static String? validatePhoneNumber(String? phoneNumber) {
    if (phoneNumber == null || phoneNumber.isEmpty) {
      return "Phone number cannot be empty";
    }
    const phoneRegex = r'^\+?[1-9]\d{1,14}$';
    if (!RegExp(phoneRegex).hasMatch(phoneNumber)) {
      return "Please enter a valid phone number";
    }
    return null;
  }

  static String? validateRequiredField(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return "$fieldName cannot be empty";
    }
    return null;
  }
}
