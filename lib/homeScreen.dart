import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:vocal_app/metronome/metronomes.dart';
import 'package:vocal_app/piano.dart';
import 'package:vocal_app/userModle.dart';
import 'package:another_flushbar/flushbar.dart';
import 'audio-recorder-main.dart';
import 'loginScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: Text("Welcome ${loggedInUser.firstName}"),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(150, 150),
                          primary: Colors.white,
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Metronome()));
                      },
                      child: Text('Metronome'),
                    ),
                    OutlinedButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(150, 150),
                          primary: Colors.white,
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Piano()));
                      },
                      child: Text('Piano'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OutlinedButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(150, 150),
                          primary: Colors.white,
                          backgroundColor: Colors.black),
                      onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => MainPage()));
                      },
                      child: Text('Pitch'),
                    ),
                    OutlinedButton(
                      style: TextButton.styleFrom(
                          minimumSize: Size(150, 150),
                          primary: Colors.white,
                          backgroundColor: Colors.black),
                      onPressed: () {
                        Flushbar(
                          message: "Lessons not yet implemented",
                          margin: EdgeInsets.all(8),
                          borderRadius: BorderRadius.circular(8),
                          duration: Duration(seconds: 3),
                        )..show(context);
                      },
                      child: Text('Lessons'),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                ActionChip(
                    label: Text("Logout"),
                    onPressed: () {
                      logout(context);
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginScreen()));
  }
}
