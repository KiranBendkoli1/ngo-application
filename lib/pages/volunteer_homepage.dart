import 'package:flutter/material.dart';

class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome>{
  @override
  Widget build(BuildContext context) {

    double screenHeight = MediaQuery.of(context).size.height;

    double screenWidth = MediaQuery.of(context).size.width;
    

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to the Home page"),
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
                    "Schedules",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("View all")
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
                      Container(
                        decoration: BoxDecoration(color: Color.fromARGB(255, 144, 231, 247)),
                        child: Text("Location"),
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
                    "Viewed Projects",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("View all")
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
                      Container(
                        decoration: BoxDecoration(color: Color.fromARGB(255, 144, 231, 247)),
                        child: Text("Projects"),
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
                    "Posts",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text("View all")
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
                      
                      Container(
                        decoration: BoxDecoration(color: Color.fromARGB(255, 144, 231, 247)),
                        child: Text("Like and Share"),
                      )
                    ],
                  ),
                );
              },
              itemCount: 10,
            ),
          ),
        ),
      ],
     ),
    );
  }
}