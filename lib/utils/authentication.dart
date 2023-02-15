import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ngo_app/model/user_model.dart';
import 'package:ngo_app/pages/admin_homepage.dart';
import 'package:ngo_app/pages/user_homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthenticationHelper {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  get user => _auth.currentUser;

  bool _isSignedIn = false;
  bool get isSignedIn => _isSignedIn;

  String? _uid;
  String get uid => _uid!;

  late UserModel _userModel;
  UserModel get userModel => _userModel;

  void checkSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    _isSignedIn = s.getBool("is_signedin") ?? false;
  }

  void setSignIn() async {
    final SharedPreferences s = await SharedPreferences.getInstance();
    s.setBool('is_signedin', true);
    _isSignedIn = true;
  }

  // Sign Up Method
  Future signUp(
      {required String email,
      required String password,
      required String phoneNumber,
      required String name}) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      final data = {
        "name": name,
        "email": email,
        "phoneNumber": phoneNumber,
        "date": Timestamp.now(),
        "uid": _auth.currentUser!.uid,
      };
      await _firestore
          .collection("users")
          .doc(_auth.currentUser!.uid)
          .set(data)
          .then((value) {
        Fluttertoast.showToast(
          msg: "Sign Up Successful",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.blueGrey,
          fontSize: 12,
        );
      });

      return null;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        fontSize: 12,
      );
      return e.message;
    }
  }

  // Sign In Method
  Future signIn(
      {required BuildContext context,
      required String email,
      required String password}) async {
    try {
      var data;
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => Fluttertoast.showToast(
                msg: "Sign In Successful",
                toastLength: Toast.LENGTH_LONG,
                gravity: ToastGravity.BOTTOM,
                backgroundColor: Colors.blueGrey,
                fontSize: 12,
              ))
          .then((value) {
        final docRef =
            _firestore.collection("roles").doc(_auth.currentUser!.uid);
        docRef.get().then((DocumentSnapshot doc) {
          data = doc.data() as Map<String, dynamic>;
          if (data['admin']) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => AdminHomePage()));
          } else {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserHomePage()));
          }
        });
      });
      return null;
    } on FirebaseAuthException catch (e) {
      Fluttertoast.showToast(
        msg: e.message.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Color.fromRGBO(96, 125, 139, 1),
        fontSize: 12,
      );
      return e.message;
    }
  }

  // Sign Out Method
  Future signOut() async {
    String? email = _auth.currentUser!.email;
    await _auth.signOut();
    Fluttertoast.showToast(
      msg: "$email Signed Out",
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.blueGrey,
      fontSize: 12,
    );
  }

  Future resetPassword({required String email}) async {
    try {
      await _auth.sendPasswordResetEmail(email: email).then(
            (value) => Fluttertoast.showToast(
              msg: "Password reset link is sent on $email",
              toastLength: Toast.LENGTH_LONG,
              gravity: ToastGravity.BOTTOM,
              backgroundColor: Colors.blueGrey,
              fontSize: 12,
            ),
          );
    } catch (e) {
      Fluttertoast.showToast(
        msg: e.toString(),
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.blueGrey,
        fontSize: 12,
      );
    }
  }
}
