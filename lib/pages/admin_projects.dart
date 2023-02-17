// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngo_app/components/add_project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AdminProjects extends StatefulWidget {
  const AdminProjects({super.key});

  @override
  State<AdminProjects> createState() => _AdminProjectsState();
}

class _AdminProjectsState extends State<AdminProjects> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var allProjects;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('projects').get();
    setState(() {
      allProjects = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
    print(allProjects);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    TextEditingController searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome Admin"),
        leading: Icon(Icons.clear_all_rounded),
      ),
      body: allProjects == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(top: 30, left: 12, right: 12),
                child: TextField(
                  controller: searchController,
                  decoration: InputDecoration(
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide:
                          BorderSide(color: Color(0x00ffffff), width: 1),
                    ),
                    hintText: "Search Projects",
                    hintStyle: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                      fontSize: 14,
                      color: Color(0xff9f9d9d),
                    ),
                    filled: true,
                    fillColor: Color(0xfff2f2f3),
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                    prefixIcon: Icon(Icons.search),
                    suffixIcon: IconButton(
                      color: Colors.grey,
                      onPressed: () {},
                      icon: Icon(
                        Icons.send,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text("All Project"),
              ),
              // all project section
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
                child: SizedBox(
                  height: screenHeight / 5,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return (allProjects[index]['imageUrl'] == null)
                          ? Center(
                              child: CircularProgressIndicator(),
                            )
                          : Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              elevation: 5,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              child: Column(
                                children: [
                                  allProjects[index]['imageUrl'] == null
                                      ? Center(
                                          child: CircularProgressIndicator(),
                                        )
                                      : Image.network(
                                          allProjects[index]['imageUrl'],
                                          height: screenHeight / 6,
                                          colorBlendMode: BlendMode.colorBurn,
                                        ),
                                  Container(
                                    decoration:
                                        BoxDecoration(color: Colors.white),
                                    child: Text(
                                        allProjects[index]['projectTitle']),
                                  )
                                ],
                              ),
                            );
                    },
                    itemCount: allProjects.length,
                  ),
                ),
              ),

              // scheduled in this week
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 15),
                child: Text("Will be held"),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8, top: 5),
                child: SingleChildScrollView(
                  child: SizedBox(
                    height: screenHeight / 2.35,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return (allProjects[index]['imageUrl'] == null)
                            ? Center(
                                child: CircularProgressIndicator(),
                              )
                            : Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                elevation: 5,
                                clipBehavior: Clip.antiAliasWithSaveLayer,
                                child: Row(
                                  children: [
                                    allProjects[index]['imageUrl'] == null
                                        ? Center(
                                            child: CircularProgressIndicator(),
                                          )
                                        : Image.network(
                                            allProjects[index]['imageUrl'],
                                            height: screenHeight / 12,
                                            colorBlendMode: BlendMode.colorBurn,
                                          ),
                                    Container(
                                      decoration:
                                          BoxDecoration(color: Colors.white),
                                      child: Text(
                                          allProjects[index]['projectTitle']),
                                    )
                                  ],
                                ),
                              );
                      },
                      itemCount: allProjects.length,
                    ),
                  ),
                ),
              ),
            ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => AddProject()));
        },
        backgroundColor: Color(0xFF0B5D0B),
        child: Icon(Icons.add),
      ),
    );
  }
}
