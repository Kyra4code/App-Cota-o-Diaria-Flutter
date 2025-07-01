import 'package:flutter/material.dart';
import 'pages/main_screen.dart';
import 'pages/dolar_page.dart';
import 'pages/euro_page.dart';
void main() {
  runApp(MaterialApp(
    home: MainScreen(),
    routes: {
      "/home": (context) => MainScreen(),
      "/dolar_page": (context) => DolarPage(),
      "/euro_page": (context) => EuroPage()
    }
  ));
}
