import 'package:color_app/helpers/helper_functions.dart';
import 'package:color_app/models/color_model.dart';
import 'package:flutter/material.dart';

class ColorDetailScreen extends StatelessWidget {
  final ColorProps colorDetail;

  const ColorDetailScreen({super.key, required this.colorDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(colorDetail.name),
      ),
      body: Center(
        child: Column(
          children: [
            Text(colorDetail.group),
            Text(colorDetail.hex),
            Text(colorDetail.name),
            Text(colorDetail.rgb),
            Text(colorDetail.theme),
            Container(
                width: 100,
                height: 100,
                color: Color(HelperFunctions.getColorFromHex(colorDetail.hex))),
          ],
        ),
      ),
    );
  }
}
