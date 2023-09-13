import 'dart:html';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:happy_tails/adoption_screen.dart';
import 'package:happy_tails/animal_details_screen.dart';
import 'package:happy_tails/menu_frame.dart';
import 'package:happy_tails/menu_screen.dart';

void main() {
  runApp(MainApp());
}

Color maincolor = Color.fromARGB(255, 69, 134, 88);
Color startingcolor = Color.fromARGB(255, 69, 134, 88);

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'happy tails',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: maincolor),
      home: MenuFrame(),
    );
  }
}
