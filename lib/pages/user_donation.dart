import 'package:flutter/material.dart';

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
        title: const Text("Welcome to the donation page"),
      ),
      body: Container(
        child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: const Text(
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
                margin: EdgeInsets.all(5),
              ),
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: const Text(
                  'Othwr Donations [Clothes, Books and more]',
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
