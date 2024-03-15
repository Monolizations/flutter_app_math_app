import 'package:flutter/material.dart';
import '../../classes/sharedprefs.dart';
import 'addition.dart';
import 'division.dart';
import 'multiplication.dart';
import 'subtraction.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final SharedPreferencesManager _prefsManager =
      SharedPreferencesManager(); // Create an instance of SharedPreferencesManager

  String playerName = '';

  @override
  void initState() {
    super.initState();
    _getPlayerName(); // Call _getPlayerName() to retrieve player name when the screen initializes
  }

  Future<void> _getPlayerName() async {
    String? name = await _prefsManager
        .getPlayerName(); // Get player name from SharedPreferences
    setState(() {
      playerName = name ?? ''; // Update playerName variable
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 40,
            ),
            const Text(
              "Choose an Operation",
              textAlign: TextAlign.center,
              style: TextStyle(fontFamily: 'IriGrov', fontSize: 25),
            ),
            Container(
              width: screenW,
              height: screenH - 76,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Image.asset(
                      "assets/images/bg_homescrin.png",
                      width: screenW,
                    ),
                  ),
                  Positioned(
                      bottom: 0,
                      right: 0,
                      child: Image.asset("assets/images/mamamo.png",
                          width: screenW * 0.4)),
                  Positioned(
                      bottom: 80,
                      left: 50,
                      child: Container(
                        width: 190,
                        child: Text(
                            "Hi $playerName! Please choose an operation to play with",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'IriGrov',
                                fontSize: 29,
                                color: Colors.white)),
                      )),
                  Positioned(
                    top: 40,
                    left: 50,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Addition()));
                        },
                        child: Image.asset(
                          "assets/images/addition.png",
                          width: 120,
                        )),
                  ),
                  Positioned(
                    top: 40,
                    right: 50,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Subtraction()));
                        },
                        child: Image.asset(
                          "assets/images/subtract.png",
                          width: 120,
                        )),
                  ),
                  Positioned(
                    top: 180,
                    left: 50,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const Multiplication()));
                        },
                        child: Image.asset(
                          "assets/images/multiply.png",
                          width: 120,
                        )),
                  ),
                  Positioned(
                    top: 180,
                    right: 50,
                    child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Division()));
                        },
                        child: Image.asset(
                          "assets/images/division.png",
                          width: 120,
                        )),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
