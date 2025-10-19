import 'dart:collection';
import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int Oscore = 0;
  int Xscore = 0;
  int filled_boxes = 0;
  static var myNewFont = GoogleFonts.roboto(
      // ignore: prefer_const_constructors
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.comicNeue(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  bool ohTurn = true; // 1st turn is oh O
  List<String> displayExOh = [
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ];
  var myTextStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(),
        body: Column(children: <Widget>[
          Expanded(
            child: Container(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Player'X'",
                              style: myNewFontWhite,
                            ),
                            Text(
                              Xscore.toString(),
                              style: myTextStyle,
                            ),
                          ]),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "\t \tPlayer'O'",
                              style: myNewFontWhite,
                            ),
                            Text(
                              Oscore.toString(),
                              style: myTextStyle,
                            ),
                          ]),
                    ),
                  ]),
            ),
          ),
          Expanded(
            flex: 3,
            child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3),
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      _itis_tapped(index);
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                                color:
                                    const Color.fromARGB(255, 163, 160, 160))),
                        child: Center(
                          child: Text(displayExOh[index],
                              style: const TextStyle(
                                  color: Colors.white, fontSize: 40)),
                        )),
                  );
                }),
          ),
          Expanded(
              child: Container(
            child: Center(
                child: Column(children: [
              Text(
                "TIC X TAC O TOE",
                style: myNewFontWhite,
              ),
              const SizedBox(
                height: 60,
                width: 20,
              ),
              Text(
                "@HaRu_H!10",
                style: GoogleFonts.comicNeue(
                  color: Colors.white,
                  fontSize: 20,
                ),
              )
            ])),
          )),
        ]));
  }

  void _itis_tapped(int index) {
    setState(() {
      if (ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'O';
        filled_boxes += 1;
      } else if (!ohTurn && displayExOh[index] == '') {
        displayExOh[index] = 'X';
        filled_boxes += 1;
      }
      ohTurn = !ohTurn;
      check_winner();
    });
  }

  void check_winner() {
    // 1st row
    if (displayExOh[0] == displayExOh[1] &&
        displayExOh[0] == displayExOh[2] &&
        displayExOh[0] != '') {
      _showWin(displayExOh[0]);
    }
    // 2nd row
    if (displayExOh[3] == displayExOh[4] &&
        displayExOh[3] == displayExOh[5] &&
        displayExOh[3] != '') {
      _showWin(displayExOh[3]);
    }
    // 3rd row
    if (displayExOh[6] == displayExOh[7] &&
        displayExOh[6] == displayExOh[8] &&
        displayExOh[6] != '') {
      _showWin(displayExOh[6]);
    }
    //1 col
    if (displayExOh[0] == displayExOh[3] &&
        displayExOh[0] == displayExOh[6] &&
        displayExOh[0] != '') {
      _showWin(displayExOh[0]);
    }
    // 2 col
    if (displayExOh[1] == displayExOh[4] &&
        displayExOh[1] == displayExOh[7] &&
        displayExOh[1] != '') {
      _showWin(displayExOh[1]);
    }
    // 3 col
    if (displayExOh[2] == displayExOh[5] &&
        displayExOh[2] == displayExOh[8] &&
        displayExOh[2] != '') {
      _showWin(displayExOh[2]);
    }
    // diagonal

    if (displayExOh[0] == displayExOh[4] &&
        displayExOh[0] == displayExOh[8] &&
        displayExOh[0] != '') {
      _showWin(displayExOh[0]);
    }
    if (displayExOh[2] == displayExOh[4] &&
        displayExOh[2] == displayExOh[6] &&
        displayExOh[2] != '') {
      _showWin(displayExOh[2]);
    } else if (filled_boxes == 9) {
      _showDraw();
    }
  }

  void _showWin(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Winner is $winner"),
            actions: [
              FloatingActionButton(
                  child: const Text("Once More"),
                  onPressed: () {
                    _clearboard();
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
    if (winner == 'O') {
      Oscore += 1;
    } else if (winner == 'X') {
      Xscore += 1;
    }
  }

  void _clearboard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayExOh[i] = '';
      }
    });
    filled_boxes = 0;
  }

  void _showDraw() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.purple,
            title: Text("Ahh!! It is Draw._. ", style: myTextStyle),
            actions: [
              FloatingActionButton(
                  child: const Text("Retry"),
                  onPressed: () {
                    _clearboard();
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
