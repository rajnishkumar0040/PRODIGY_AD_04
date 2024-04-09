import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool oTurn = true;
  List<String> displayXO = ['', '', '', '', '', '', '', '', ''];
  String result = '';
  int countbox = 0;
  int played = 0;
  bool end = false;
  int countO = 0;
  int countX = 0;
  List<int> winnerbox = [];

  void reset() {
    setState(() {
      for (int i = 0; i < 9; i++) {
        displayXO[i] = '';
      }
      result = '';
    });
    countbox = 0;
    winnerbox.clear();
    oTurn = true;
    end = false;
  }

  void clickboard(int index) {
    setState(() {
      if (oTurn && displayXO[index] == '') {
        displayXO[index] = 'O';
      } else if (!oTurn && displayXO[index] == '') {
        displayXO[index] = 'X';
      }
      oTurn = !oTurn;
      countbox++;
      checkwinner();
      if (result.contains('Player O Wins !')) {
        countO++;
      } else if (result.contains('Player X Wins !')) {
        countX++;
      }
    });
  }

  void checkwinner() {
    if (displayXO[0] == displayXO[1] &&
        displayXO[0] == displayXO[2] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins !';
        winnerbox.addAll([0, 1, 2]);
        played++;
        end = true;
      });
    }
    if (displayXO[3] == displayXO[4] &&
        displayXO[3] == displayXO[5] &&
        displayXO[3] != '') {
      setState(() {
        result = 'Player ${displayXO[3]} Wins !';
        winnerbox.addAll([3, 4, 5]);
        played++;
        end = true;
      });
    }
    if (displayXO[6] == displayXO[7] &&
        displayXO[6] == displayXO[8] &&
        displayXO[6] != '') {
      setState(() {
        result = 'Player ${displayXO[6]} Wins !';
        winnerbox.addAll([6, 7, 8]);
        played++;
        end = true;
      });
    }
    if (displayXO[0] == displayXO[3] &&
        displayXO[0] == displayXO[6] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins !';
        winnerbox.addAll([0, 3, 6]);
        played++;
        end = true;
      });
    }
    if (displayXO[1] == displayXO[4] &&
        displayXO[1] == displayXO[7] &&
        displayXO[1] != '') {
      setState(() {
        result = 'Player ${displayXO[1]} Wins !';
        winnerbox.addAll([1, 4, 7]);
        played++;
        end = true;
      });
    }
    if (displayXO[2] == displayXO[5] &&
        displayXO[2] == displayXO[8] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins !';
        winnerbox.addAll([2, 5, 8]);
        played++;
        end = true;
      });
    }
    if (displayXO[0] == displayXO[4] &&
        displayXO[0] == displayXO[8] &&
        displayXO[0] != '') {
      setState(() {
        result = 'Player ${displayXO[0]} Wins !';
        winnerbox.addAll([0, 4, 8]);
        played++;
        end = true;
      });
    }
    if (displayXO[2] == displayXO[4] &&
        displayXO[2] == displayXO[6] &&
        displayXO[2] != '') {
      setState(() {
        result = 'Player ${displayXO[2]} Wins !';
        winnerbox.addAll([2, 4, 6]);
        played++;
        end = true;
      });
    }
    if (countbox == 9) {
      setState(() {
        result = 'Nobody Wins !';
        played++;
        end = true;
      });
    }
  }

  var font = GoogleFonts.coiny(
    color: Colors.white,
    fontSize: 24,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.redAccent,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(height: 50),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Text(
                        'Player O',
                        style: font,
                      ),
                      Text(
                        countO.toString(),
                        style: font,
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'Player X',
                        style: font,
                      ),
                      Text(
                        countX.toString(),
                        style: font,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: GridView.builder(
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 6.0,
                  mainAxisSpacing: 6.0,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      !end ? clickboard(index) : null;
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        border: Border.all(
                          width: 5,
                          color: winnerbox.contains(index)
                              ? const Color.fromARGB(255, 7, 64, 110)
                              : Colors.amber,
                        ),
                        color: winnerbox.contains(index)
                            ? const Color.fromARGB(255, 7, 64, 110)
                            : Colors.amber,
                      ),
                      child: Center(
                        child: Text(
                          displayXO[index],
                          style: GoogleFonts.coiny(
                            color: Colors.redAccent,
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Text(
                      result,
                      style: GoogleFonts.coiny(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 100,
                    child: played != 0
                        ? ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.amber,
                              foregroundColor: Colors.black,
                            ),
                            onPressed: reset,
                            child: const Text('Reset !'),
                          )
                        : null,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
