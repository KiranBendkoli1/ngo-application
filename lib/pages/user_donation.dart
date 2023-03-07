import 'package:flutter/material.dart';
import 'package:ngo_app/pages/payment_home.dart';

class UserDonation extends StatefulWidget {
  const UserDonation({super.key});

  @override
  State<UserDonation> createState() => _UserDonationState();
}

class _UserDonationState extends State<UserDonation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff0b3005),
        title: const Text(
          "Welcome to the donation page",
          style: TextStyle(color: Color(0xffffffff)),
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
      ),
      body: Container(
        child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: Container(
                      alignment: Alignment.center,
                      color: Colors.grey,
                      child: Text(
                        'Donate Money',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.normal,
                          fontSize: 16,
                          color: Color(0xffffffff),
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.clip,
                      ),
                      margin: EdgeInsets.all(5))),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: const Text(
                  'Other Donations [Clothes, Books and more]',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                    fontSize: 16,
                    color: Color(0xffffffff),
                  ),
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.clip,
                ),
                margin: EdgeInsets.all(5),
              ),
            ]),
      ),
    );
  }
}
