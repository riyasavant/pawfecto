import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AdoptMain extends StatefulWidget {
  static const String id = 'adopt_main';
  @override
  _AdoptMainState createState() => _AdoptMainState();
}

class _AdoptMainState extends State<AdoptMain> {
  final _auth = FirebaseAuth.instance;

  // FirebaseUser class was changed to User
  User loggedInUser;

  @override
  void initState() {
    super.initState();

    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        top: true,
        bottom: true,
        right: true,
        left: true,
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 40.0),
              child: Container(
                child: ElevatedButton(
                  child: Text('Logout'),
                  onPressed: () {
                    _auth.signOut();
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}