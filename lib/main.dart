import 'dart:convert';

import 'model/ayah.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<Ayah> fetchAyah() async {
  final response =
      await http.get(Uri.parse('https://quran-randomizer.herokuapp.com/'));

  if (response.statusCode == 200) {
    return Ayah.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load ayah');
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Future<Ayah> futureAyah;

  @override
  void initState() {
    super.initState();
    futureAyah = fetchAyah();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_rounded),
          onPressed: () => '',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('Quran Randomizer'),
        ),
        body: Center(
          child: FutureBuilder<Ayah>(
            future: futureAyah,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data!.arabText);
              } else if (snapshot.hasError) {
                return Text('${snapshot.hasError}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
