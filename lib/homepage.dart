import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool oTurn = true; //the first player is O!

  List<String> displayXO = [
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

  var myTextStyle = const TextStyle(color: Colors.white, fontSize: 30);
  int oScore = 0;
  int xScore = 0;
  int filledBoxes = 0;

  // static var myNewFont = GoogleFonts.pressStart2p(
  //     textStyle: TextStyle(color: Colors.black, letterSpacing: 3));

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Player X',
                      style: myNewFontWhite,
                    ),
                    const Divider(
                      color: Colors.transparent,
                      height: 20,
                    ),
                    Text(
                      xScore.toString(),
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Player O',
                      style: myNewFontWhite,
                    ),
                    const Divider(
                      color: Colors.transparent,
                      height: 20,
                    ),
                    Text(
                      oScore.toString(),
                      style: myNewFontWhite.copyWith(fontSize: 20),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30,
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
                    _tapped(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF616161))),
                    child: Center(
                      child: Text(
                        displayXO[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: Center(
                child: Column(
              children: [
                Text('TIC TAC TOE', style: myNewFontWhite),
                const SizedBox(
                  height: 60,
                ),
                Text('Game For Everyone', style: myNewFontWhite),
              ],
            )),
          ),
        ],
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
        filledBoxes += 1;
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
        filledBoxes += 1;
      }
      oTurn = !oTurn;
      _checkWinner();
    });
  }

  void _checkWinner() {
    //check 1st row
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }
    //check 2nd row
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      _showWinDialog(displayXO[3]);
    }

    //check 3rd row
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
    }

    //check 1st column
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    }
    //chech 2nd column
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      _showWinDialog(displayXO[1]);
    }

    //check 3rd column
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      _showWinDialog(displayXO[2]);
    }

    //check diagonal
    if (displayXO[6] == displayXO[4] &&
        displayXO[6] == displayXO[2] &&
        displayXO[6] != '') {
      _showWinDialog(displayXO[6]);
    }
    //check diagonal

    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      _showWinDialog(displayXO[0]);
    } else if (filledBoxes == 9) {
      _showDrawDialog();
    }
  }

  void _showDrawDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('DRAW'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _clearBoard;
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again!'),
              ),
            ],
          );
        });

    _clearBoard();
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('WINNER IS: $winner'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _clearBoard;
                  Navigator.of(context).pop();
                },
                child: const Text('Play Again!'),
              ),
            ],
          );
        });

    if (winner == 'O') {
      oScore += 1;
    } else if (winner == 'X') {
      xScore += 1;
    }
    _clearBoard();
  }

  void _clearBoard() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
    });
    filledBoxes = 0;
  }
}
