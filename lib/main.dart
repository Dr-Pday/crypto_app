import 'package:crypto_app/Screens/main_page.dart';
import 'package:crypto_app/data/constants/contants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: greenColor,
        body: SafeArea(
          child: MainPage(),
        ),
      ),
    );
  }
}
