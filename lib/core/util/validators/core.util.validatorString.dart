extension CoreUtilValidatorString on String {
  bool get isInvalidEmail {
    final RegExp emailRegExp = RegExp(
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$');
    return !emailRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    return length < 8;
  }
}
