// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/pages/login_screen.dart';
import 'package:ngo_app/pages/volunteer_info.dart';

class VolunteerSchedule extends StatefulWidget {
  const VolunteerSchedule({super.key});

  @override
  State<VolunteerSchedule> createState() => _VolunteerScheduleState();
}

class _VolunteerScheduleState extends State<VolunteerSchedule> {
  var data,
      taskm,
      taskts,
      taskw,
      taskt,
      taskf,
      tasks,
      tasksu,
      start_time,
      finish_time;

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
      taskm = data['taskm'];
      taskts = data['tasks'];
      taskw = data['taskw'];
      taskt = data['taskt'];
      taskf = data['taskf'];
      tasks = data['tasks'];
      tasksu = data['tasksu'];
      start_time = data['start_time'];
      finish_time = data['finish_time'];
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedules'),
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
      body: Container(
        child: Card(
          elevation: 3.0,
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Monday"),
                  subtitle: Text(
                      "Task: ${taskm ?? 'Taskm'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Tuesday"),
                  subtitle: Text(
                      "Task: ${taskts ?? 'Taskts'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Wednesday"),
                  subtitle: Text(
                      "Task: ${taskw ?? 'Taskw'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Thursday"),
                  subtitle: Text(
                      "Task: ${taskt ?? 'Taskth'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Friday"),
                  subtitle: Text(
                      "Task: ${taskf ?? 'Taskf'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Saturday"),
                  subtitle: Text(
                      "Task: ${tasks ?? 'Tasks'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
                ListTile(
                  leading: Icon(Icons.first_page),
                  title: Text("Sunday"),
                  subtitle: Text(
                      "Task: ${tasksu ?? 'Tasksu'} \n Start Time: ${start_time ?? 'start time'} \n Finish Time: ${finish_time ?? 'finish_time'}"),
                ),
                Divider(
                  height: 10.0,
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
