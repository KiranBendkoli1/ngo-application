// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AdminProjects extends StatefulWidget {
  const AdminProjects({super.key});

  @override
  State<AdminProjects> createState() => _AdminProjectsState();
}

class _AdminProjectsState extends State<AdminProjects> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Admin"),
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Future Projects",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("See all")
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: screenHeight / 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/img1.jpg",
                        height: screenHeight / 6,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text("Project 2"),
                      )
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Ongoing Projects",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("See all")
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: screenHeight / 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/img1.jpg",
                        height: screenHeight / 6,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text("Project 2"),
                      )
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            width: screenWidth,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Past Projects",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text("See all")
                ]),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            height: screenHeight / 5,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  elevation: 5,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Column(
                    children: [
                      Image.asset(
                        "assets/images/img1.jpg",
                        height: screenHeight / 6,
                      ),
                      Container(
                        decoration: BoxDecoration(color: Colors.white),
                        child: Text("Project 2"),
                      )
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Color(0xFF0B5D0B),
        child: Icon(Icons.add),
      ),
    );
  }
}
