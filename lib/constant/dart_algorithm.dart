class Expression {
  static bool containsNumber(String value) {
    // Regular expression to match at least one digit
    RegExp regex = RegExp(r'\d');
    return regex.hasMatch(value);
  }

  //Check atleast lowercase
  static bool containsLowerCase(String value) {
    RegExp regExp = RegExp(r'[a-z]');
    RegExp regExpUpperCase = RegExp(r'[A-Z]');
    return regExp.hasMatch(value) && regExpUpperCase.hasMatch(value);
  }
}
