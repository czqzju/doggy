import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'RandomDoggy.dart';
import 'BreedsList.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("Doggy"),
          backgroundColor: Colors.blue,
        ),
        body: DogPage(),
      ),
    ),
  );
}

class DogPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          RaisedButton(
            child: Text("Random doggy"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RandomDoggy()),
              );
            },
          ),
          RaisedButton(
            child: Text("BREEDS LIST"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BreedsList()),
              );
            },
          ),
        ],
      ),
    );
  }
}
