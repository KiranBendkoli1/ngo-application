import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

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
                  'Donate',
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
                  'Volunteer',
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
