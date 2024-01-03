bool containsOnlyNumbers(String input) {
  final RegExp regex = RegExp(r'^[0-9]+$');
  return regex.hasMatch(input);
}
