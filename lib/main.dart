import 'package:flutter/material.dart';
import 'package:list_car/pages/login/login_page.dart';
import 'pages/colors.dart';

void main(n) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: corfUnco,
        primarySwatch: Colors.red,
      ),
      home: LoginPage(),
    );
  }
}
