import 'package:flutter/material.dart';

class AdminProfile extends StatelessWidget {
  const AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome Kiran"),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Text("Admin Profile"),
        ),
      ),
    );
  }
}
