import 'package:color_app/helpers/helper_functions.dart';
import 'package:color_app/models/color_model.dart';
import 'package:color_app/screens/color_detail_screen.dart';
import 'package:flutter/material.dart';

class ColorTile extends StatelessWidget {
  final String name;
  final String theme;
  final String group;
  final String hex;
  final String rgb;

  const ColorTile(
      {super.key,
      required this.name,
      required this.theme,
      required this.group,
      required this.hex,
      required this.rgb});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
                child: Column(
              children: [
                Text(name),
                Text(theme),
                Text(group),
                Text(hex),
                Text(rgb)
              ],
            )),
            Expanded(
              child: Container(
                  width: 20,
                  height: 20,
                  color: Color(HelperFunctions.getColorFromHex(hex))),
            )
          ],
        ),
        ElevatedButton(
          
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ColorDetailScreen(
                    colorDetail: ColorProps(
                        name: name,
                        theme: theme,
                        group: group,
                        hex: hex,
                        rgb: rgb));
              }));
            },
            child: const Text("See the detail!"))
      ],
    );
  }
}
