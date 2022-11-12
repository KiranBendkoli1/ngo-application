// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngo_app_ui/pages/admin_homepage.dart';

void main() {
  runApp(const NGOApplication());
}

class NGOApplication extends StatelessWidget {
  const NGOApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xfff0b5d0b),
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0B5D0B),
        ),
      ),
      title: "NGO Application",
      home: AdminHomePage(),
    );
  }
}
