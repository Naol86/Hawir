import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hawir/screens/welcome_screen.dart';

class HeroScreen extends ConsumerWidget {
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
            // how to draw a circle
            Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
              child: Center(
                child: Text('Logo'),
              ),
            ),
            const SizedBox(height: 80),
            Text(
              'Hawir',
              style: GoogleFonts.badScript(
                  fontSize: 64, fontStyle: FontStyle.italic),
            ),

            const SizedBox(
              width: 150,
              height: 50,
              child: const Text(
                'Your Journey, Perfectly Planned',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'poppins',
                    fontStyle: FontStyle.italic),
              ),
            ),

            const SizedBox(height: 20),
            OutlinedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return WelcomeScreen();
                  }),
                );
              },
              style: OutlinedButton.styleFrom(
                  minimumSize: const Size(200, 50),
                  side: const BorderSide(
                    color: Colors.black,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              icon: const Icon(Icons.arrow_forward, color: Colors.black),
              iconAlignment: IconAlignment.end,
              label: const Text('Continue',
                  style: TextStyle(fontSize: 21, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}
