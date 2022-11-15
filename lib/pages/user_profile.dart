import 'package:flutter/material.dart';

class UseProfile extends StatefulWidget {
  const UseProfile({super.key});

  @override
  State<UseProfile> createState() => _UseProfileState();
}

class _UseProfileState extends State<UseProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: Icon(
          Icons.arrow_back,
          color: Color(0xff212435),
          size: 24,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Profile",
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 120.0,
                    width: 120.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60.0),
                      boxShadow: [
                        BoxShadow(
                            blurRadius: 3.0,
                            offset: Offset(0, 4.0),
                            color: Colors.black38),
                      ],
                      image: DecorationImage(
                        image: AssetImage(
                          "assets/images/breakfast.jpeg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "John Voe",
                        style: TextStyle(
                          fontSize: 16.0,
                        ),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        "john123@gmail.com",
                        style: TextStyle(color: Colors.grey),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      //SmallButton(btnText: "Edit"),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        leading: Icon(Icons.location_on),
                        title: Text("City"),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Age"),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      ListTile(
                        leading: Icon(Icons.badge),
                        title: Text("Rewards"),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      ListTile(
                        leading: Icon(Icons.payment),
                        title: Text("Payment"),
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Notifications",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                elevation: 3.0,
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "App Notification",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          /* Switch(
                                   value: turnOnNotification,
                                  onChanged: (bool value) {
                                    // print("The value: $value");
                                    setState(() {
                                      turnOnNotification = value;
                                    });
                                  },
                                ),*/
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Location Tracking",
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                      Divider(
                        height: 10.0,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30.0,
              ),
              Text(
                "Other",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Card(
                child: Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Language", style: TextStyle(fontSize: 16.0)),
                        // SizedBox(height: 10.0,),
                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),
                        Text("Currency", style: TextStyle(fontSize: 16.0)),
                        // SizedBox(height: 10.0,),
                        Divider(
                          height: 30.0,
                          color: Colors.grey,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
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
