import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Color App",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40.0),
        ),
        Text("This application made with Flutter!")
      ],
    ));
  }
}
