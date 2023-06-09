import 'package:bangerzz/components/square_tile.dart';
import 'package:bangerzz/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white70,
      body: SafeArea(
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(
              'Banger',
              style: GoogleFonts.abel(
                fontSize: 75.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 45,
            ),
            const Icon(
              Icons.speaker,
              size: 200,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Login:',
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            const SizedBox(
              height: 35,
            ),
            // Google and Apple sign in
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              // Apple
              SquareTile(
                onTap: () {
                  debugPrint('Apple Sign In');
                },
                imagePath: 'images/apple.png',
              ),
              const SizedBox(
                width: 30,
              ),
              // Google
              SquareTile(
                onTap: () => AuthService().signWithGoogle(),
                imagePath: 'images/google.png',
              ),
              const SizedBox(
                width: 30,
              ),
              // Microsoft
              SquareTile(
                  onTap: () {
                    debugPrint('Mircosoft Sign In');
                  },
                  imagePath: 'images/microsoft.png')
            ])
          ]),
        ),
      ),
    );
  }
}
