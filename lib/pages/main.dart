import 'dart:convert';
import 'package:pfe/pages/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'login.dart';
import 'inserteAbbsence.dart';
import 'choix.dart';
//import http package manually

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext Context) {
    return MaterialApp(
      //appel la class homepage
      home: Choix(),
    );
  }
}


 



