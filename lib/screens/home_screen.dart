// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, unused_local_variable

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:quotesapp/screens/second_screen.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body : Center(
          child: ElevatedButton(
            onPressed: () async{
              var url = Uri.parse('http://api.quotable.io/random');
              var response = await http.get(url);
              
              print('Response status: ${response.statusCode}');
              print('Response body: ${response.body}');

              var data = jsonDecode(response.body);
              
              String quote=data["content"];
              String author=data["author"];

              Navigator.of(context).push(
                 MaterialPageRoute(builder: (context) => SecondScreen(
                   quoteText: quote,authorName: author,)));
              },
             child: Text('Get Quote!'),
      ),
        ),
    ),
    );
}
}