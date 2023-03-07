// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/pages/admin_volunteerschedule.dart';
import 'package:ngo_app/pages/login_screen.dart';
import 'package:ngo_app/pages/volunteer_info.dart';
import 'package:ngo_app/pages/volunteer_schedule.dart';
import 'package:ngo_app/pages/update_schedule.dart';

class VolunteerProfile extends StatefulWidget {
  const VolunteerProfile({super.key});

  @override
  State<VolunteerProfile> createState() => _VolunteerProfileState();
}

class _VolunteerProfileState extends State<VolunteerProfile> {
  var data,
      name,
      email,
      bloodgroup,
      dob,
      imageUrl,
      age,
      city,
      gender,
      mobile,
      address,
      state,
      pincode,
      nationality;

  @override
  void initState() {
    // TODO: implement initState
    getVolunteersData();
    super.initState();
  }

  void getVolunteersData() {
    FirebaseAuth _auth = FirebaseAuth.instance;
    FirebaseFirestore _firestore = FirebaseFirestore.instance;
    final docRef =
        _firestore.collection("volunteers").doc(_auth.currentUser?.email);
    docRef.get().then((DocumentSnapshot doc) {
      data = doc.data() as Map<String, dynamic>;
      imageUrl = data['imageUrl'];
      name = data['name'];
      email = data['email'];
      dob = data['Date of Birth'];
      age = data['age'];
      city = data['city'];
      gender = data['gender'];
      address = data['address'];
      state = data['state'];
      pincode = data['pincode'];
      nationality = data['nationality'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
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
        leading: Icon(
          Icons.arrow_back,
          size: 24,
        ),
      ),
      body: imageUrl == null
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Profile",
                      style: TextStyle(
                        fontSize: 32.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          height: 120.0,
                          width: 120.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(60.0),
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 3.0,
                                  offset: Offset(0, 4.0),
                                  color: Colors.black38),
                            ],
                            image: DecorationImage(
                              image: NetworkImage(imageUrl),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "$name",
                              style: TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Text(
                              "$email",
                              style: TextStyle(color: Colors.grey),
                            ),
                            SizedBox(
                              height: 20.0,
                            ),
                            //SmallButton(btnText: "Edit"),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Column(
                      children: [
                        MaterialButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => VolunteerInfo(),
                              ),
                            );
                          },
                          color: Color(0xff0b5d0b),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Edit/Add Info",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.normal,
                            ),
                          ),
                          textColor: Color(0xffffffff),
                          height: 40,
                          minWidth: MediaQuery.of(context).size.width,
                        ),
                        SizedBox(
                          height: 6,
                        ),
                      ],
                    ),
                    Text(
                      "Account",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            ListTile(
                              leading: Icon(Icons.location_on),
                              title: Text("${city ?? 'City'}"),
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.person),
                              title: Text("${age ?? 'Age'}"),
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                            ListTile(
                              leading: Icon(Icons.badge),
                              title: Text("Rewards"),
                            ),
                            Divider(
                              height: 10.0,
                              color: Colors.grey,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    Text(
                      "Schedules",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => VolunteerSchedule(),
                                  ),
                                );
                              },
                              color: Color(0xff0b5d0b),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Check Schedules",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: Color(0xffffffff),
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),

                    /* Adding to admin page
                    Card(
                      elevation: 3.0,
                      child: Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Column(
                          children: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => UpdateSchedule(),
                                  ),
                                );
                              },
                              color: Color(0xff0b5d0b),
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Text(
                                "Admin Schedules",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                  fontStyle: FontStyle.normal,
                                ),
                              ),
                              textColor: Color(0xffffffff),
                              height: 40,
                              minWidth: MediaQuery.of(context).size.width,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30.0,
                    ),*/
                  ],
                ),
              ),
            ),
    );
  }
}
