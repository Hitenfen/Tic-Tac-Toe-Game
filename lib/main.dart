import 'dart:collection';
import 'dart:html';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_x_oc/screen.dart';
import 'package:path_provider/path_provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(debugShowCheckedModeBanner: false, home: Intro());
  }
}

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  static var myNewFont = GoogleFonts.roboto(
      // ignore: prefer_const_constructors
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.comicNeue(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.black38,
          body: Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 120.0),
                    child: Container(
                        child: Text("TIC TAC TOE",
                            style: GoogleFonts.pressStart2p(
                                fontSize: 35, color: Colors.brown[80]))),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Container(
                    child: AvatarGlow(
                      duration: const Duration(seconds: 2),
                      glowColor: Colors.lightBlue.shade50,
                      repeat: true,
                      startDelay: const Duration(seconds: 1),
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                              style: BorderStyle.none,
                            ),
                            shape: BoxShape.circle),
                        child: CircleAvatar(
                          backgroundColor:
                              const Color.fromARGB(255, 239, 232, 232),
                          radius: 80,
                          child: Image.asset(
                            "assets/u/11.jpg",
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Container(
                      child: Text(
                        "@HaRu__H!lO",
                        style: myNewFontWhite.copyWith(fontSize: 20),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomePage()),
                    );
                  },
                  child: Padding(
                    padding:
                        const EdgeInsets.only(left: 40, right: 40, bottom: 60),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(30),
                        color: const Color.fromARGB(255, 140, 101, 203),
                        child: Center(
                          child: Text("Let's Play",
                              style: GoogleFonts.pressStart2p(
                                  fontSize: 25, color: Colors.white)),
                        ),
                      ),
                    ),
                  ),
                ),
              ]))),
    );
  }
}
