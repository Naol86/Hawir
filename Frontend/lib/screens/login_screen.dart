import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        padding: const EdgeInsets.only(top: 40),
        width: double.infinity,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(50),
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
              const SizedBox(height: 20),
              Text(
                'Hawir',
                style: GoogleFonts.badScript(
                    fontSize: 64, fontStyle: FontStyle.italic),
              ),

              const SizedBox(
                width: 150,
                height: 50,
                child: Text(
                  'Your Journey, Perfectly Planned',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 15,
                      fontFamily: 'poppins',
                      fontStyle: FontStyle.italic),
                ),
              ),
              const SizedBox(height: 10),

              // email and password fields
              const SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Email',
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(
                width: 250,
                height: 50,
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Password',
                  ),
                ),
              ),

              const SizedBox(height: 20),
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
                label: const Text('Login',
                    style: TextStyle(color: Colors.white, fontSize: 21)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
