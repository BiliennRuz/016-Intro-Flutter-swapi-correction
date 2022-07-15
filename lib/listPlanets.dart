import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class ListPlanets extends StatefulWidget {
  const ListPlanets({Key? key}) : super(key: key);

  @override
  State<ListPlanets> createState() => _ListPlanetsState();
}

class _ListPlanetsState extends State<ListPlanets> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Swapi2"),
        actions: [
          IconButton(icon:Icon(Icons.delete),onPressed: (){},)
        ],
      ),
      body:SafeArea(
          child: FutureBuilder<Response>(
            future: get(Uri.parse("https://swapi.dev/api/planets?_limit=1000")),
            builder: (context, snapshot) {
              if(snapshot.connectionState == ConnectionState.waiting){
                return const CircularProgressIndicator();
              }
              else if (snapshot.hasError){
                return const Icon(Icons.warning);
              }
              else {
                Response? response = snapshot.data;
                if(response == null){
                  return const Icon(Icons.warning);
                }
                //On récupère une map JSON de toute notre réponse
                Map<String,dynamic> responseMap = jsonDecode(response.body);
                //On récupère notre lise de planète en JSON dans le tableau "results"
                List<dynamic> result = responseMap["results"];

                return ListView.builder(
                    itemCount: result.length,
                    itemBuilder: (_,index){
                      return ListTile(
                        leading: Icon(Icons.public),
                        title: Text("${result[index]["name"]}"),
                      );
                    }
                );
              }

            }
          )
      )
    );
  }
}
