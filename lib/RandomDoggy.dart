import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RandomDoggy extends StatefulWidget {
  @override
  _RandomDoggyState createState() {
    var res = _RandomDoggyState();
    res.onClick();
    return res;
  }
}

class _RandomDoggyState extends State<RandomDoggy> {
  String imgUrl = "";

  onClick() async {
    var url = "https://dog.ceo/api/breeds/image/random";
    var response = await http.get(url);
    setState(() {
      imgUrl = jsonDecode(response.body)['message'];
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
          Expanded(child: Image.network(imgUrl)),
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
