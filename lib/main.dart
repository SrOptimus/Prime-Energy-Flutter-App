import 'package:flutter/material.dart';
import 'package:flutter_prime_energy/pages/firstpage.dart';

void main() {
  runApp(MaterialApp(
    // remove debug banner
    debugShowCheckedModeBanner: false,
    // puxa firstpage primeiro
    home: FirstPage(),
    // tema geral do app
    theme: ThemeData(
//      brightness: Brightness.dark,
        primaryColor: Colors.deepOrange,
        accentColor: Colors.deepOrangeAccent),
  ));
}