import 'package:color_app/screens/browse_color_screen.dart';
import 'package:color_app/screens/pick_random_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      padding: const EdgeInsets.all(12),
      textStyle: const TextStyle(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)));

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Welcome to Color App!",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
        ),
        const Text("Please pick one below!"),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: <Widget>[
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const PickRandomScreen();
                    }));
                  },
                  style: buttonStyle,
                  child: const Text('Pick my lucky color!'),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                  child: ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return const BrowseColorScreen();
                  }));
                },
                style: buttonStyle,
                child: const Text('Browse for color'),
              ))
            ],
          ),
        )
      ],
    ));
  }
}
