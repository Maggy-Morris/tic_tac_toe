import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tic_tac_toe/homepage.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  static var myNewFont = GoogleFonts.pressStart2p(
      textStyle: const TextStyle(color: Colors.black, letterSpacing: 3));

  static var myNewFontWhite = GoogleFonts.pressStart2p(
      textStyle:
          const TextStyle(color: Colors.white, letterSpacing: 3, fontSize: 15));
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 120),
                  child: Text(
                    'TIC TAC TOE',
                    style: myNewFontWhite.copyWith(fontSize: 30),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: AvatarGlow(
                  endRadius: 140,
                  duration: const Duration(seconds: 2),
                  glowColor: Colors.white,
                  repeat: true,
                  repeatPauseDuration: const Duration(seconds: 1),
                  startDelay: const Duration(seconds: 1),
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(style: BorderStyle.none),
                        shape: BoxShape.circle),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[900],
                      radius: 80.0,
                      child: Image.asset(
                        'assets/Tic_tac_toe.svg.png',
                        color: Colors.white,
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top:80.0),
                  child: Text(
                    'Ready To Play',
                    style: myNewFontWhite.copyWith(fontSize: 20),
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(
                    context,
                     MaterialPageRoute(builder: (context) => const HomePage()),);
                },
                child: Padding(padding: const EdgeInsets.only(left: 40,right:40,bottom:60),
                
                child: ClipRRect(borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: const EdgeInsets.all(30),
                  color: Colors.white,
                  child: Center(
                    child: Text('PLAY GAME',style: myNewFont,
                    ),
                  ),
                ),),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
