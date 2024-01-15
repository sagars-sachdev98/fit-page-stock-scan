import 'package:flutter/material.dart';

class Utils {
  static Color? stringToColor(String? color) {
    if (color == null) {
      return null;
    }

    switch (color) {
      case 'green':
        return Colors.green;
      case 'red':
        return Colors.red;
      default:
        return null;
    }
  }

  static String trimDouble(double? value) {
    String stringValue = value?.toString() ?? "";
    if (stringValue.contains('.')) {
      stringValue =
          stringValue.replaceAll(RegExp(r"0*$"), ""); // Remove trailing zeros
      stringValue = stringValue.replaceAll(RegExp(r"\.$"),
          ""); // Remove the decimal point if it's the last character
    }
    return stringValue;
  }

  static String capitalize(String text) {
    if (text.isEmpty) {
      return text;
    }
    return text[0].toUpperCase() + text.substring(1);
  }
}
