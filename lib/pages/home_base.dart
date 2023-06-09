import 'package:bangerzz/services/auth_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart';
import 'feed.dart';
import 'profile.dart';

class BasePage extends StatefulWidget {
  const BasePage({super.key});

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  int currentPage = 1;
  List<Widget> pages = const [FeedPage(), HomePage(), ProfilePage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple[800],
        title: Text('Banger',
            style: GoogleFonts.abel(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )),
        leading: IconButton(
          onPressed: () {
            FirebaseAuth.instance.signOut();
            Navigator.of(context).push(
              MaterialPageRoute(builder: (BuildContext context) {
                return AuthPage();
              }),
            );
          },
          icon: const Icon(Icons.logout_outlined),
        ),
      ),
      body: pages[currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: const [
          NavigationDestination(icon: Icon(Icons.feed_rounded), label: 'Feed'),
          NavigationDestination(
              icon: Icon(Icons.calendar_month_sharp), label: 'Calendar'),
          NavigationDestination(
              icon: Icon(Icons.person_4_rounded), label: 'Profile'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            currentPage = index;
          });
        },
        selectedIndex: currentPage,
      ),
    );
  }
}
