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
          title: const Text('NGO Application'),
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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ImageSlideshow(
                indicatorColor: Colors.blue,
                onPageChanged: (value) {
                  debugPrint('Page changed: $value');
                },
                autoPlayInterval: 5000,
                isLoop: true,
                children: [
                  Image.asset(
                    'assets/images/img1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/img1.jpg',
                    fit: BoxFit.cover,
                  ),
                  Image.asset(
                    'assets/images/img1.jpg',
                    fit: BoxFit.cover,
                  ),
                ]),
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
                    color: Colors.grey,
                    child: Column(children: [
                      Image.asset(
                        "assets/images/donate.png",
                        height: screenHeight / 5,
                        width: screenHeight / 5,
                        fit: BoxFit.fitWidth,
                      ),
                      Text("Donate")
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
                    color: Colors.grey,
                    child: Column(children: [
                      Image.asset(
                        "assets/images/volunteer.png",
                        height: screenHeight / 5,
                        width: screenHeight / 5,
                        fit: BoxFit.fitWidth,
                      ),
                      Text("Volunteer")
                    ]),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                MaterialButton(
                  onPressed: () {},
                  color: Color(0xff0b5d0b),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "About Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                MaterialButton(
                  onPressed: () {},
                  color: Color(0xff0b5d0b),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Text(
                    "Contact Us",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            )
          ],
        ));
  }
}
