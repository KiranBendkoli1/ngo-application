import 'package:flutter/material.dart';
import 'package:ngo_app_ui/pages/user_profile.dart';
import 'package:ngo_app_ui/pages/user_search.dart';

class UserCategory extends StatefulWidget {
  const UserCategory({super.key});

  @override
  State<UserCategory> createState() => _UserCategoryState();
}

class _UserCategoryState extends State<UserCategory> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Categories'),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xff212435),
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
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
                backgroundColor: Color(0xfff0b5d0b)),
            BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: 'Category',
                backgroundColor: Color(0xfff0b5d0b)),
            BottomNavigationBarItem(
                icon: Icon(Icons.search),
                label: 'Search',
                backgroundColor: Color(0xfff0b5d0b)),
            BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Person',
                backgroundColor: Color(0xfff0b5d0b)),
          ],
          type: BottomNavigationBarType.shifting,
          //currentIndex: _selectedIndex,
          selectedItemColor: Colors.black,
          iconSize: 40,
          //onTap: _onItemTapped,
          elevation: 5),
    );
    ;
  }
}
