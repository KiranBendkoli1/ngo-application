import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AdminVolunteers extends StatefulWidget {
  const AdminVolunteers({super.key});

  @override
  State<AdminVolunteers> createState() => _AdminVolunteersState();
}

class _AdminVolunteersState extends State<AdminVolunteers> {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var allVolunteers;
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await _firestore.collection('volunteers').get();
    setState(() {
      allVolunteers = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
    print(allVolunteers);
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Volunteers Page"),
        flexibleSpace: Container(
          // ignore: prefer_const_constructors
          decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                colors: [
                  Color(0xFF024E04),
                  Color(0xFF0B5D0B),
                ]),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: screenHeight / 1.29,
          child: allVolunteers == null
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: allVolunteers.length,
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
                            Image.network(
                              allVolunteers[index]['imageUrl'],
                              width: screenWidth / 5,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(allVolunteers[index]['name']),
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
                  }),
                ),
        ),
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
