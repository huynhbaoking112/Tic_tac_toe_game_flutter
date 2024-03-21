
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled/hompage.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: IntroScreen(),
    );
  }
}

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: TextStyle(color: Colors.black, letterSpacing: 3));
  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Expanded(
                  child: Text(
                    "TIC TAC TOE",
                    style: myNewFontWhite,
                  ),
                  flex: 1),
              Expanded(
                child: Container(
                    width: 250,
                    height: 250,
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                    ),
                    child: Center(
                      child: AvatarGlow(
                        startDelay: const Duration(milliseconds: 1000),
                        glowColor: Colors.white12,
                        glowShape: BoxShape.circle,
                        // animate: _animate,
                        curve: Curves.fastOutSlowIn,
                        child: Image.asset('lib/images/tictactoelogo.png',height: 170,),
                        duration: Duration(milliseconds: 2000),
                      ),
                    ),
                    ),
                flex: 3,
              ),
              Expanded(
                  child: Text(
                    "@CREATEDBYBAOKING",
                    style: myNewFontWhite,
                  ),
                  flex: 1),
              Expanded(
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 35, vertical: 35),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
                      },
                      child: Text("PLAY GAME", style: myNewFont,),
                    ),
                  ),
                  flex: 1),
            ],
          ),
        ),
      ),
    );
  }
}
