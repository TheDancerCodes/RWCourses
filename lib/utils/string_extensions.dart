extension StringExtension on String {

  // Capitalized Method ~ Makes the first letter upper case then extracts the rest of the string 
  // using a sub string.
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1)}";
  }
}