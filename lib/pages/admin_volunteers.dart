import 'package:flutter/material.dart';

class AdminVolunteers extends StatelessWidget {
  const AdminVolunteers({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Volunteers Page"),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
            height: screenHeight / 1.29,
            child: ListView.builder(itemBuilder: ((context, index) {
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
                        width: screenWidth / 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Volunteer Name"),
                              SizedBox(
                                width: screenWidth / 12,
                              ),
                              Text("ID : 2")
                            ],
                          ),
                          Text("Project Assigned"),
                        ],
                      ),
                      Icon(
                        Icons.navigate_next,
                        color: Colors.grey.shade500,
                      )
                    ],
                  ),
                ),
              );
            }))),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.edit),
        tooltip: "Edit",
        backgroundColor: Color(0xFF0B5D0B),
      ),
    );
  }
}
