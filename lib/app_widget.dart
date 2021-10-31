import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/create_note_page.dart';
import 'package:notes/home_page.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.purple),
      title: "Note",
      routes: {
        "/": (context) => HomePage(),
        "/create-note": (context) => CreateNotePage(),
      },
    );
  }
}
