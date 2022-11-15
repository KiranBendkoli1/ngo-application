import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app_ui/pages/user_category.dart';
import 'package:ngo_app_ui/pages/user_homepage.dart';
import 'package:ngo_app_ui/pages/user_profile.dart';
import 'package:ngo_app_ui/pages/user_search.dart';

class UserNavigation extends StatefulWidget {
  const UserNavigation({super.key});

  @override
  State<UserNavigation> createState() => _UserNavigationState();
}

class _UserNavigationState extends State<UserNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    const List<Widget> pages = <Widget>[
      UserHomePage(),
      UserCategory(),
      UserSearch(),
      UseProfile()
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
            icon: Icon(Icons.star),
            label: "Rewards",
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
