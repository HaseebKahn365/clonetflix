import 'package:clonetflix/screens/home_screen.dart';
import 'package:clonetflix/screens/nav_screens.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Netflix UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue, scaffoldBackgroundColor: Colors.black),
      home: (MediaQuery.of(context).size.width > 600) ? const HomeScreen() : const NavScreen(),
    );
  }
}
