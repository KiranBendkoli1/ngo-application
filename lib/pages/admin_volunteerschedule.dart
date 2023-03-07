// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/pages/login_screen.dart';
import 'package:ngo_app/pages/volunteer_info.dart';
import 'package:ngo_app/pages/volunteer_schedule.dart';

class AdminVSchedule extends StatefulWidget {
  const AdminVSchedule({super.key});

  @override
  State<AdminVSchedule> createState() => _AdminVScheduleState();
}

class _AdminVScheduleState extends State<AdminVSchedule> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Training Schedules'),
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
          color: Color(0xff212435),
          size: 24,
        ),
      ),
      body: Container(
        child: StreamBuilder(
          stream:
              FirebaseFirestore.instance.collection('volunteers').snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var data = snapshot.data!.docs[index].data()
                        as Map<String, dynamic>;
                    return Container(
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15)),
                        child: Row(
                          children: [
                            Container(
                              width: 230,
                              child: Text(data['name']),
                            ),
                            Container(
                              child: Text(data['email']),
                            ),
                          ],
                        ));
                  });
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }
}
