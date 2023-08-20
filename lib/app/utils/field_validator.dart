class TextFieldValidators {
  // dynamic firstNameErrorGetter(String value) {
  //   if (value.isEmpty) {
  //     return 'Please Enter First Name';
  //   } else if (value.length > 30) {
  //     return 'First Name length Should be less than 30';
  //   } else if (value.length < 3) {
  //     return 'First Name must at least 3 characters';
  //   }
  //   return null;
  // }

  // dynamic lastNameErrorGetter(String value) {
  //   if (value.isEmpty) {
  //     return 'Please Enter Last Name';
  //   } else if (value.length > 30) {
  //     return 'Last Name length Should be less than 30';
  //   } else if (value.length < 3) {
  //     return 'Last Name must at least 3 characters';
  //   }
  //   return null;
  // }

  dynamic validateFirstName(String value) {
    if (value.isEmpty) {
      return 'First Name is required';
    }

    if (value.length < 3) {
      return 'First Name should be at least 3 characters';
    }

    return null; // Validation passed
  }

  dynamic validateLastName(String value) {
    if (value.isEmpty) {
      return 'Last Name is required';
    }

    if (value.length < 3) {
      return 'Last Name should be at least 3 characters';
    }

    return null; // Validation passed
  }

  dynamic validatePassword(String value) {
    if (value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 8) {
      return 'Password should be at least 8 characters';
    }

    // Check for at least one uppercase letter, one lowercase letter, one digit, and one special symbol
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'Password must include at least one uppercase, one lowercase, one digit, and one special symbol';
    }

    return null; // Validation passed
  }

  dynamic validateNewPassword(String value) {
    if (value.isEmpty) {
      return 'New Password is required';
    }

    if (value.length < 8) {
      return 'New Password should be at least 8 characters';
    }

    // Check for at least one uppercase letter, one lowercase letter, one digit, and one special symbol
    if (!RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(value)) {
      return 'New Password must include at least one uppercase, one lowercase, one digit, and one special symbol';
    }

    return null; // Validation passed
  }

  dynamic validateAddress(String value) {
    if (value.isEmpty) {
      return 'Address is required';
    }

    if (value.length < 10) {
      return 'Address should be at least 10 characters';
    }

    return null; // Validation passed
  }

  dynamic validateNote(String value) {
    if (value.isEmpty) {
      return 'Note is required';
    }

    if (value.length < 10) {
      return 'Note should be at least 10 characters';
    }

    return null; // Validation passed
  }

  dynamic noteErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Note';
    }
    return null;
  }

  dynamic uniqueTokenErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Code';
    } else if (value.length != 4) {
      return 'Code must be 4 characters';
    }
    return null;
  }

  dynamic nameErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Name';
    } else if (value.length > 60) {
      return 'Name length Should be less than 60';
    } else if (value.length < 3) {
      return 'Name must at least 3 characters';
    }

    return null;
  }

  dynamic titleErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Title';
    } else if (value.length > 60) {
      return 'Title length Should be less than 60';
    } else if (value.length < 4) {
      return 'Title must at least 4 characters';
    }

    return null;
  }

  dynamic budgetRangeErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Budget';
    }
    if (int.parse(value) < 5) {
      return 'Budget Must Be Greater than \$5';
    }
    if (value.length >= 7) {
      return 'Budget Must be less then or equal to 6 digits';
    }

    return null;
  }

  dynamic noOfPeopleNeededErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Number of People Needed';
    }
    if (value.length > 2) {
      return 'Number of People Must be in 2 digits';
    }

    return null;
  }

  dynamic descriptionErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Please Enter Description';
    } else if (value.length > 500) {
      return 'Description length Should be less than 500';
    } else if (value.length < 10) {
      return 'Description must at least 10 characters';
    }
    return null;
  }

  dynamic emailErrorGetter(String value) {
    if (value.isEmpty) {
      return 'Enter your Email address';
    } else if (!RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return 'Enter a Valid Email address';
    }
    return null;
  }

  // dynamic passwordErrorGetter(String value) {
  //   if (value.isEmpty) {
  //     return 'PLease Enter Password';
  //   }
  //   if (value.length < 8) {
  //     return 'Password Should be at least 8 characters';
  //   }
  //   return null;
  // }

  dynamic confirmPasswordErrorGetter(String confirmPassword, String password) {
    if (confirmPassword.isEmpty) {
      return 'PLease Enter Confirm Password';
    } else if (confirmPassword.trim() != password.trim()) {
      return 'Confirm Password Should be Same as Password';
    }
    return null;
  }

  // dynamic phoneNumberErrorGetter(String value) {
  //   if (value.isEmpty) {
  //     return 'PLease Enter Phone Number';
  //   }
  //   if (value.length < 9) {
  //     return 'Phone Number Should be at least 9 characters';
  //   }
  //   return null;
  // }
  // dynamic phoneNumberErrorGetter(String value) {
  //   if (value.isEmpty) {
  //     return 'Please Enter Phone Number';
  //   }
  //   if (value.length != 10) {
  //     return 'Mobile Number must be of 10 digit';
  //   }
  //   return null;
  // }

  dynamic validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return 'Phone number is required';
    }

    // Regular expression for the new Pakistan phone number format: 03XXXXXXXXX
    RegExp phoneRegExp = RegExp(r'^03[0-9]{9}$');

    if (!phoneRegExp.hasMatch(value)) {
      return 'Please use the format 03XXXXXXXXX';
    }

    return null; // Validation passed
  }

  // String urlPattern =
  //     r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
  // // var match = RegExp( , caseSensitive: false)
  // //     .firstMatch('https://www.google.com');
  // var match = RegExp(urlPattern);

  dynamic urlErrorGetter(String value) {
    if (!RegExp(
            r"([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?")
        .hasMatch(value)) {
      return 'Enter Valid Url';
    }
    return null;
  }
}
