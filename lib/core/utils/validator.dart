class Validator {
  static String? validateEmail(String? val) {
    final RegExp emailRegex = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
    );
    if (val == null || val.trim().isEmpty) {
      return 'Enter your email address.';
    } else if (!emailRegex.hasMatch(val)) {
      return 'This Email is not valid (e.g., example@example.com).';
    } else {
      return null;
    }
  }

  static String? validatePassword(String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your password.';
    } else if (val.length < 8) {
      return 'Must be at least 8 char.';
    } else {
      return null;
    }
  }

  static String? validateConfirmPassword(String? val, String password) {
    if (val == null || val.isEmpty) {
      return 'Confirm your password.';
    } else if (val != password) {
      return 'Passwords do not match.';
    } else {
      return null;
    }
  }

  static String? validateUsername(String? val) {
    final RegExp usernameRegex = RegExp(r'^[a-zA-Z0-9,.-]+$');
    if (val == null || val.isEmpty) {
      return 'Please enter a username.';
    } else if (!usernameRegex.hasMatch(val)) {
      return 'Username can only contain letters, numbers, commas, periods, and dashes.';
    } else {
      return null;
    }
  }

  static String? validateFirstName(String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your first name.';
    } else {
      return null;
    }
  }

  static String? validateLastName(String? val) {
    if (val == null || val.isEmpty) {
      return 'Enter your last name.';
    } else {
      return null;
    }
  }

  static String? validatePhoneNumber(String? val) {
    if (val == null || val.trim().isEmpty) {
      return 'Enter your phone number.';
    } else if (int.tryParse(val.trim()) == null) {
      return 'Phone number must contain numbers only.';
    } else if (val.trim().length != 11) {
      return 'This Phone number is not valid.';
    } else {
      return null;
    }
  }
}
