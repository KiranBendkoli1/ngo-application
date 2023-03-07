import 'package:flutter/material.dart';
import 'package:ngo_app/pages/volunteer_profile.dart';
import 'package:ngo_app/pages/volunteer_search.dart';

class VolunteerCategory extends StatefulWidget {
  const VolunteerCategory({super.key});

  @override
  State<VolunteerCategory> createState() => _VolunteerCategoryState();
}

class _VolunteerCategoryState extends State<VolunteerCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
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
        child: GridView(
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                color: Colors.grey,
                child: const Text(
                  'Blood Donation',
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
                  'Eye Checkup',
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
                  'Education',
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
                  'Economic Development',
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
                  'Environmental advocay',
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
                  'Childrens Rights',
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
                  'Eduction',
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
                  'Women rights',
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
    ;
  }
}
