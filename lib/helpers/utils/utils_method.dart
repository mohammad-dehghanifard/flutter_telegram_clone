bool validateIranPhoneNumber(String value) {
  const String pattern = r'^(\+98|0)?9\d{9}$';
  RegExp regExp = RegExp(pattern);
  if(regExp.hasMatch(value)){
    return true;
  }
  return false;
}