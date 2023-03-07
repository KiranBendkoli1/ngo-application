import 'package:flutter/material.dart';
import 'package:ngo_app/components/add_project.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class VolunteerHomePage extends StatefulWidget {
  const VolunteerHomePage({super.key});

  @override
  State<VolunteerHomePage> createState() => _VolunteerHomePageState();
}

class _VolunteerHomePageState extends State<VolunteerHomePage> {
  final List<Map<String, dynamic>> _allProj = [
    {"id": 1, "name": "Give Directly", "address": "Nashik"},
    {"id": 2, "name": "APOPO", "address": "Nashik"},
    {"id": 3, "name": "charity: water", "address": "Nashik"},
    {"id": 4, "name": " Wild4Life", "address": "Nashik"},
    {"id": 5, "name": " ZanaLife", "address": "Nashik"},
    {"id": 6, "name": "ColaLife", "address": "Nashik"},
    {"id": 7, "name": "Tomike Health", "address": "Nashik"},
    {"id": 8, "name": "UNICEF", "address": "Nashik"},
    {"id": 9, "name": "Wikimedia Foundation", "address": "Nashik"},
    {"id": 10, "name": "Frontline SMS", "address": "Nashik"},
  ];

  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var allProjects;
  String projectName = "";
  void initState() {
    super.initState();
    _foundProj = _allProj;
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('projects').get();
    setState(() {
      allProjects = querySnapshot.docs.map((doc) => doc.data()).toList();
    });
    print(allProjects);
  }

  List<Map<String, dynamic>> _foundProj = [];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Welcome to the Home page"),
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Ongoing Project",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 24,
                color: Color(0xff0b3005),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundProj.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundProj.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundProj[index]["id"]),
                        color: Colors.grey,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundProj[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(_foundProj[index]['name'],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${_foundProj[index]["address"].toString()} ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
            Text(
              "Upcoming Project",
              textAlign: TextAlign.start,
              overflow: TextOverflow.clip,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
                fontSize: 24,
                color: Color(0xff0b3005),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: _foundProj.isNotEmpty
                  ? ListView.builder(
                      itemCount: _foundProj.length,
                      itemBuilder: (context, index) => Card(
                        key: ValueKey(_foundProj[index]["id"]),
                        color: Colors.grey,
                        elevation: 4,
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: ListTile(
                          leading: Text(
                            _foundProj[index]["id"].toString(),
                            style: const TextStyle(
                                fontSize: 24, color: Colors.white),
                          ),
                          title: Text(_foundProj[index]['name'],
                              style: TextStyle(color: Colors.white)),
                          subtitle: Text(
                              '${_foundProj[index]["address"].toString()} ',
                              style: TextStyle(color: Colors.white)),
                        ),
                      ),
                    )
                  : const Text(
                      'No results found',
                      style: TextStyle(fontSize: 24),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
