// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminProjectInfo extends StatefulWidget {
  const AdminProjectInfo({super.key});

  @override
  State<AdminProjectInfo> createState() => _AdminProjectInfoState();
}

class _AdminProjectInfoState extends State<AdminProjectInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Project Name")),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset("assets/images/img1.jpg"),
            Text(
                "Project Description:  String data TextStyle extDi double textScaleFactor int maxLines String semanticsLabel TextWidthBasis"),
            Text("Team Leader"),
            Text("Team Strength"),
            Text("Project Domain"),
            Text("Project Location"),
          ],
        ),
      ),
    );
  }
}
