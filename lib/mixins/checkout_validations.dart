mixin CheckoutValidations {
  bool isFullNameValid(String fullName) => fullName.length > 2;

  bool isMobileNumberValid(String mobileNumber) => mobileNumber.length == 11;

  bool isAddressValid(String address) => address.length > 5;

  bool isEmailValid(String email) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}
