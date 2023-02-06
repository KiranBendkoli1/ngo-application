// ignore_for_file: use_full_hex_values_for_flutter_colors, prefer_const_constructors
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:ngo_app/pages/landing_page.dart';
import 'package:ngo_app/pages/user_homepage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const NGOApplication());
}

class NGOApplication extends StatelessWidget {
  const NGOApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Color(0xfff0b5d0b),
        primarySwatch: Colors.green,
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF0B5D0B),
        ),
      ),
      title: "NGO Application",
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              if (snapshot.hasData) {
                return UserHomePage();
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('${snapshot.error}'),
                );
              }
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return LandingPage();
          }),
    );
  }
}
