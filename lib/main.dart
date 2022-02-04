import 'dart:convert';

import 'package:quran_rand_flutter/widget/ayah_widget.dart';

import 'model/ayah.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late Ayah ayah = const Ayah(
      nameOfSurah: '', numberOfAyah: 0, arabText: '', idTranslation: '');

  @override
  void initState() {
    super.initState();
  }

  void fetchAyah() async {
    var response =
        await http.get(Uri.parse('https://quran-randomizer.herokuapp.com/'));
    var ayahFetched = Ayah.fromJson(jsonDecode(response.body));
    setState(() {
      ayah = ayahFetched;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.refresh_rounded),
          onPressed: () => fetchAyah(),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        appBar: AppBar(
          title: const Text('Quran Randomizer'),
        ),
        body: AyahWidget(ayah),
      ),
    );
  }
}
