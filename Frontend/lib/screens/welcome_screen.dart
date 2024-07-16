import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawir/screens/login_screen.dart';

class WelcomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 150,
              height: 150,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: const Center(
                child: Text('Logo'),
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Welcome To ',
                    style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'poppins',
                        fontWeight: FontWeight.bold)),
                Text(
                  'Hawir',
                  style: GoogleFonts.badScript(
                      fontSize: 30, fontStyle: FontStyle.italic),
                ),
              ],
            ),
            const SizedBox(height: 10),
            const SizedBox(
              width: 170,
              height: 150,
              child: Text(
                "Whether you're organizing a group trip, renting a car, or exploring new destinations, we've got you covered. Log in or sign up to start planning your perfect journey with our awesome features!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontFamily: 'poppins',
                ),
              ),
            ),
            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(250, 50),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              iconAlignment: IconAlignment.end,
              label: const Text('Login',
                  style: TextStyle(fontSize: 21, color: Colors.black)),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(0, 10, 26, 1),
                  minimumSize: const Size(250, 50),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              iconAlignment: IconAlignment.end,
              label: const Text('Sign Up',
                  style: TextStyle(color: Colors.white, fontSize: 21)),
            ),
          ],
        ),
      ),
    );
  }
}
