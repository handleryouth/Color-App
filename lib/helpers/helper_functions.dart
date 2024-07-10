import 'dart:convert';

class HelperFunctions {
  static List<T> parsedJsonDataToList<T>(
      String data, Function(dynamic) callback) {
    final parsed = jsonDecode(data) as List;
    parsed.cast<Map<String, dynamic>>();

    return parsed.map<T>((json) => callback(json)).toList();
  }

  static int getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }
}
