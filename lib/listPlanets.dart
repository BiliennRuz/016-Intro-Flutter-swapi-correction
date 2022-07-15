import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ListPlanets extends StatefulWidget {
  const ListPlanets({Key? key}) : super(key: key);

  @override
  State<ListPlanets> createState() => _ListPlanetsState();
}

class _ListPlanetsState extends State<ListPlanets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Swapi"),),
      body:SafeArea(child: Text("Hello world"))
    );
  }
}
