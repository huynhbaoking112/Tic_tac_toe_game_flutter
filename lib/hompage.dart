import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> arr = List<String>.filled(9, '');

  String signature = "X";
  String winner = "";

  int winX = 0;
  int winY = 0;

  void resetsGame(){
    setState(() {
      arr = List<String>.filled(9, '');
      winner = "";
    });
  }


  void onTap(int index, BuildContext context) {
    setState(() {
      if (arr[index] == "") {
        arr[index] = signature;
        checkWin(context);
        checkFull(context);
        signature = signature == "X" ? "O" : "X";
      }
    });
  }

  void checkFull(BuildContext context) {
    bool check = arr.every((e) => e != '');
    if (check) {
      alert(context, "full");
    }
  }

  void resetGame(BuildContext context) {
    setState(() {
      arr = List<String>.filled(9, '');
      winner = "";
    });
    Navigator.pop(context);
  }

  Future<dynamic> alert(BuildContext context, String type) {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          title: type == "full"
              ? Text('The match was tied')
              : Text('$winner is Winner'),
          actions: [
            // IconButton(onPressed:() => resetGame(context), icon: Icon(Icons.check, color: Colors.green,size: 20,))
            TextButton(
                onPressed: () => resetGame(context), child: Text("Play Again!"))
          ],
        );
      },
    );
  }

  void checkWin(BuildContext context) {
    if ((arr[0] == arr[1] &&
            arr[0] == arr[2] &&
            (arr[0] == 'X' || arr[0] == "O")) ||
        (arr[3] == arr[4] &&
            arr[3] == arr[5] &&
            (arr[3] == 'X' || arr[3] == "O")) ||
        (arr[6] == arr[7] &&
            arr[6] == arr[8] &&
            (arr[8] == 'X' || arr[8] == "O")) ||
        (arr[0] == arr[3] &&
            arr[0] == arr[6] &&
            (arr[0] == 'X' || arr[0] == "O")) ||
        (arr[1] == arr[4] &&
            arr[1] == arr[7] &&
            (arr[1] == 'X' || arr[1] == "O")) ||
        (arr[2] == arr[5] &&
            arr[2] == arr[8] &&
            (arr[8] == 'X' || arr[8] == "O")) ||
        (arr[0] == arr[4] &&
            arr[0] == arr[8] &&
            (arr[0] == 'X' || arr[0] == "O")) ||
        (arr[2] == arr[4] &&
            arr[2] == arr[6] &&
            (arr[2] == 'X' || arr[2] == "O"))) {
      winner = signature;
      setState(() {
        winner == "X" ? winX++ : winY++;
      });
      alert(context, "win");
    }
  }

  var MyCustom =
      TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w700);

  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                margin: EdgeInsets.only(top:35),
                child: Column(
                  // crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ScoreBoard",
                      style: myNewFontWhite,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Player O',
                                style: myNewFontWhite,
                              ),
                              Text(
                                winY.toString(),
                                style: myNewFontWhite,
                              )
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                'Player X',
                                style: myNewFontWhite,
                              ),
                              Text(
                                winX.toString(),
                                style: myNewFontWhite,
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )),
          Expanded(
            flex: 3,
            child: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () => onTap(index, context),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            width: 0.5, color: Colors.grey.shade700)),
                    child: Center(
                      child: Text(
                        arr[index],
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    backgroundColor: Colors.transparent
                  ),
                  onPressed: resetsGame,
                  child: Text(
                    "ResetGame",
                    style: myNewFontWhite,
                  ),
                ),
              )),
          Expanded(
              flex: 1,
              child: Container(
                child: Column(
                  children: [
                    Text("TIC TAC TOE", style: myNewFontWhite),
                    SizedBox(height: 15),
                    Text("@CREATEDBYBAOKING", style: myNewFontWhite)
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
