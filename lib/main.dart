import 'package:flutter/material.dart';
import 'package:swapi/listPlanets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarWars Companion',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const ListPlanets(),
    );
  }
}
