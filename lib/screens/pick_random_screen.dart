import 'package:color_app/constant/colors_collection.dart';
import 'package:flutter/material.dart';

class PickRandomScreen extends StatefulWidget {
  const PickRandomScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PickRandomState();
  }
}

class _PickRandomState extends State<PickRandomScreen> {
  var randomColor = ColorsCollection().getRandomValue();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Pick My Lucky Color!"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Your lucky color is:"),
              Text(
                randomColor.name,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 30.0),
              )
            ],
          ),
        ));
  }
}
