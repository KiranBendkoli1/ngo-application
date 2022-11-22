import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app_ui/pages/volunteer_category.dart';
import 'package:ngo_app_ui/pages/user_homepage.dart';
import 'package:ngo_app_ui/pages/volunteer_profile.dart';
import 'package:ngo_app_ui/pages/volunteer_search.dart';
import 'package:ngo_app_ui/pages/volunteer_homepage.dart';

class VolunteerNavigation extends StatefulWidget {
  const VolunteerNavigation({super.key});
  @override
  State<VolunteerNavigation> createState() => _VolunteerNavigationState();
}

class _VolunteerNavigationState extends State<VolunteerNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      VolunteerHomePage(),
      VolunteerCategory(),
      VolunteerSearch(),
      VolunteerProfile()
    ];
    return Scaffold(
      body: pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Home",
            backgroundColor: Color(0xFF0B5D0B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: "Category",
            backgroundColor: Color(0xFF0B5D0B),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Search",
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
