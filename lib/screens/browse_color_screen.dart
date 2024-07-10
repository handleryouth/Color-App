import 'dart:convert';
import 'package:color_app/widgets/color_tile.dart';
import 'package:http/http.dart' as http;
import 'package:color_app/models/color_model.dart';
import 'package:flutter/material.dart';

class BrowseColorScreen extends StatefulWidget {
  const BrowseColorScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PickRandomState();
  }
}

class _PickRandomState extends State<BrowseColorScreen> {
  late Future<ColorModel> futureColorRequest;

  Future<ColorModel> fetchColor() async {
    final response =
        await http.get(Uri.parse('https://csscolorsapi.com/api/colors'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var decodedJson = jsonDecode(response.body) as Map<String, dynamic>;
      var decodedResponse = ColorModel.fromJson(decodedJson);
      return decodedResponse;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Color');
    }
  }

  @override
  void initState() {
    super.initState();
    futureColorRequest = fetchColor();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Browse Color"),
      ),
      body: FutureBuilder(
          future: futureColorRequest,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.separated(
                itemCount: snapshot.data!.colors.length,
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemBuilder: (context, index) {
                  var data = snapshot.data!.colors[index];
                  return ColorTile(
                      name: data.name,
                      theme: data.theme,
                      group: data.group,
                      hex: data.hex,
                      rgb: data.rgb);
                },
              );
            } else if (snapshot.hasError) {
              return const Text("something is wrong!");
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
