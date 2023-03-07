import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:ngo_app/utils/authentication.dart';
import 'package:ngo_app/pages/landing_page.dart';
import 'package:ngo_app/pages/volunteer_navigation.dart';
import 'package:ngo_app/pages/user_donation.dart';

class UserHomePage extends StatelessWidget {
  const UserHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'NGO Application',
            style: TextStyle(color: Colors.white),
          ),
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
          elevation: 0,
          toolbarHeight: screenHeight / 12,
          actions: [
            IconButton(
              icon: Icon(Icons.logout_rounded),
              onPressed: () {
                AuthenticationHelper().signOut();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LandingPage(),
                  ),
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ImageSlideshow(
                  indicatorColor: Colors.green,
                  onPageChanged: (value) {
                    debugPrint('Page changed: $value');
                  },
                  autoPlayInterval: 5000,
                  isLoop: true,
                  children: [
                    Image.asset(
                      'assets/images/blooddonation.png',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/computerlitracy.jpg',
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      'assets/images/edu.png',
                      fit: BoxFit.cover,
                    ),
                  ]),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDonation(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      child: Column(children: [
                        Image.asset(
                          "assets/images/donate.png",
                          height: screenWidth / 3,
                          width: screenWidth / 3,
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          "Donate",
                          style:
                              TextStyle(color: Color(0xFF0B4A0E), fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ]),
                    ),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VolunteerNavigation(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.grey,
                      ),
                      child: Column(children: [
                        Image.asset(
                          "assets/images/volunteer.png",
                          height: screenWidth / 3,
                          width: screenWidth / 3,
                          fit: BoxFit.fitWidth,
                        ),
                        Text(
                          "Volunteer",
                          style:
                              TextStyle(color: Color(0xFF0B4A0E), fontSize: 18),
                        ),
                        SizedBox(
                          height: 5,
                        )
                      ]),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
        ));
  }
}
