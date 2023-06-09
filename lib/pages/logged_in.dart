import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_base.dart';

class LoggedIn extends StatelessWidget {
  LoggedIn({super.key});

  final user = FirebaseAuth.instance.currentUser!;

  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Banger',
          style: GoogleFonts.abel(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.purple[800],
        actions: [
          IconButton(onPressed: signUserOut, icon: const Icon(Icons.logout))
        ],
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              padding: const EdgeInsets.only(bottom: 25.0, top: 225.0),
              child: Text(
                'Logged in as:',
                style:
                    GoogleFonts.abel(fontSize: 35, fontWeight: FontWeight.w600),
              ),
            ),
          ),
          Text(
            user.email!,
            style: GoogleFonts.abel(fontSize: 40, fontWeight: FontWeight.w300),
          ),
          const SizedBox(
            height: 30,
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (BuildContext context) {
                  return const BasePage();
                }),
              );
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[800]),
            child: const Text('Home'),
          )
        ],
      ),
    );
  }
}
