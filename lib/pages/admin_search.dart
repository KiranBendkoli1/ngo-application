// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngo_app/components/get_geotagged_image.dart';

class AdminSearch extends StatelessWidget {
  const AdminSearch({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: ElevatedButton(
        child: Text("Get Tagging"),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => GetGeoTaggedImage()));
        },
      )),
    );
  }
}
