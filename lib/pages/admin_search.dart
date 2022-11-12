// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class AdminSearch extends StatelessWidget {
  const AdminSearch({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child:  Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: const TextField(
              decoration: InputDecoration(
                  hintText: "Enter Place",
                  suffixIcon: Icon(
                    Icons.location_on_outlined,
                  )),
            ),
          ),
          SizedBox(
            height: screenHeight / 1.28,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(
                      top: 4.0, left: 8, right: 8, bottom: 4),
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          "assets/images/img1.jpg",
                          width: screenWidth / 4,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Project Name"),
                            Text("Status"),
                            SizedBox(
                              width: screenWidth / 12,
                            ),
                          ],
                        ),
                        Icon(
                          Icons.navigate_next,
                        )
                      ],
                    ),
                  ),
                );
              }),
            ),
          )
        ],
      ),
      )
    );
  }
}
