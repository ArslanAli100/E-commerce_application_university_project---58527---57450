import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  //Sign out

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
        IconButton(
          onPressed: signUserOut, 
          icon: Icon(Icons.logout)
        )
       ]
      ),
      body: Center(
        child: Text(
          "Logged In : " + user.email!,
          style: TextStyle(fontSize: 25),
      )),
    );
  }
}