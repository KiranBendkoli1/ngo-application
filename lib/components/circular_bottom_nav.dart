import 'dart:ffi';

import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ngo_app/pages/admin_profile.dart';
import 'package:ngo_app/pages/admin_projects.dart';
import 'package:ngo_app/pages/admin_search.dart';
import 'package:ngo_app/pages/admin_volunteers.dart';

class CirculaNavbar extends StatefulWidget {
  const CirculaNavbar({super.key});

  @override
  State<CirculaNavbar> createState() => _CirculaNavbarState();
}

class _CirculaNavbarState extends State<CirculaNavbar> {
  int currentIndex = 1;
  @override
  Widget build(BuildContext context) {
    const List<Widget> _pages = <Widget>[
      AdminProjects(),
      AdminSearch(),
      AdminVolunteers(),
      AdminProfile()
    ];

    return Scaffold(
      bottomNavigationBar: CircularBottomNavigation(
        [
          TabItem(Icons.home, "Home", Color(0xFF4C75AF)),
          TabItem(Icons.search, "Search", Colors.green),
          TabItem(Icons.dashboard, "activity", Colors.green),
          TabItem(Icons.person, "Profile", Colors.green),
        ],
        selectedCallback: (selectedPos) {
          setState(() {
            currentIndex = selectedPos!;
          });
        },
        selectedPos: currentIndex,
      ),
    );
  }
}
