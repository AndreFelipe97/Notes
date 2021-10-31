import 'package:flutter/material.dart';

class AppBarWidget extends AppBar {
  final String titleText;

  @override
  final List<Widget>? actions;
  AppBarWidget({required this.titleText, this.actions})
      : super(title: Text(titleText), centerTitle: true);
}
