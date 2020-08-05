import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:json_annotation/json_annotation.dart';

class BreedsList extends StatefulWidget {
  @override
  _BreedsListState createState() => _BreedsListState();
}

class _BreedsListState extends State<BreedsList> {
  var breedsList;
  @override
  initState() {
    getBreedsList();
    super.initState();
  }

  getBreedsList() async {
    var response = await http.get("https://dog.ceo/api/breeds/list/all");
    breedsList = jsonDecode(response.body)['message'];
    var dogNames = [];
  }

  onClick() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    var response = await http.get(url);
    setState(() {
      var imgUrl = jsonDecode(response.body)['message'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Random Doggy"),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Image.network("imgUrl")),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: RaisedButton(
                child: Text('Fetch Daggy'),
                onPressed: () {
                  onClick();
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
