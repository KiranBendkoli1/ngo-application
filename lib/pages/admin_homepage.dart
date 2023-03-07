// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:ngo_app/pages/admin_profile.dart';
import 'package:ngo_app/pages/admin_projects.dart';
import 'package:ngo_app/pages/admin_volunteers.dart';
import 'package:ngo_app/pages/transaction_details.dart';

class AdminHomePage extends StatefulWidget {
  const AdminHomePage({super.key});
  @override
  State<AdminHomePage> createState() => _AdminHomePageState();
}

class _AdminHomePageState extends State<AdminHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      AdminProjects(),
      PaymentDetailsPage(
        apiKey: 'rzp_test_1SzcPrcZbeMtiS',
        apiSecret: 'NTzmUZAjCwWcy0RS6s94Jxd6',
      ),
      AdminVolunteers(),
      AdminProfile()
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // ignore: prefer_const_literals_to_create_immutables
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFF0B5D0B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payments_outlined),
            label: "Transaction history",
            backgroundColor: Color(0xFF0B5D0B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group_add),
            label: "Volunteers",
            backgroundColor: Color(0xFF0B5D0B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: Color(0xFF0B5D0B),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
