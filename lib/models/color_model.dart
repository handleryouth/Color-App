class ColorProps {
  final String name;
  final String theme;
  final String group;
  final String hex;
  final String rgb;

  ColorProps(
      {required this.name,
      required this.theme,
      required this.group,
      required this.hex,
      required this.rgb});

  factory ColorProps.fromJson(Map<String, dynamic> json) {
    return ColorProps(
        name: json["name"],
        theme: json["theme"],
        group: json["group"],
        hex: json["hex"],
        rgb: json["rgb"]);
  }
}

class ColorModel {
  final int status;
  final String statusText;
  final String message;
  final int count;
  List<ColorProps> colors;

  ColorModel(
      {required this.status,
      required this.statusText,
      required this.message,
      required this.count,
      required this.colors});

  factory ColorModel.fromJson(Map<String, dynamic> json) {
    var colorList = json["colors"] as List;

    var convertedColor =
        colorList.map((color) => ColorProps.fromJson(color)).toList();

    return ColorModel(
      status: json["status"],
      statusText: json["statusText"],
      message: json["message"],
      count: json["count"],
      colors: convertedColor,
    );
  }
}
