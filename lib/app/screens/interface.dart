// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:mathforkids/app/screens/greetings.dart';
import 'package:mathforkids/app/screens/homescreen.dart';
import 'subtraction.dart';
import '../clippath/customclip.dart';

class Interface extends StatefulWidget {
  const Interface({Key? key}) : super(key: key);

  @override
  State<Interface> createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            ClipPath(
              clipper: MainPagelClip(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.6,
                decoration: const BoxDecoration(
                  color: Color(0xff00ff57),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Transform.rotate(
                angle: -45 * 3.14 / 180,
                child: const SizedBox(
                  width: 200,
                  height: 90,
                  child: Center(
                    child: Text(
                      "1 + 2",
                      style: TextStyle(
                        fontSize: 45,
                        fontFamily: 'Madimi',
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              left: 250,
              top: 50,
              child: Transform.rotate(
                angle: 45 * 3.14 / 180,
                child: const Text(
                  "5 - 3",
                  style: TextStyle(
                    fontSize: 35,
                    fontFamily: 'Madimi',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 250,
              top: 300,
              child: Text(
                "15 x 2",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'Madimi',
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(top: 230, child: Image.asset("assets/images/minus.png")),
            Positioned(
                left: 80,
                top: 280,
                child: Image.asset("assets/images/plus.png")),
            Positioned(
                right: 90,
                top: 247,
                child: Image.asset("assets/images/divide.png")),
            Positioned(
                right: 0,
                top: 250,
                child: Image.asset("assets/images/mult.png")),
            Positioned(
                left: 25,
                top: 208,
                child: Image.asset(
                  "assets/images/undershade.png",
                  width: 337,
                )),
            Positioned(
              left: 40,
              top: 25,
              child: Image.asset(
                'assets/images/siblings.png', // Provide the path to your image
                width: 300,
                height: 300,
              ),
            ),
            const Positioned(
                left: 130,
                bottom: 150,
                child: SizedBox(
                  width: 130,
                  height: 90,
                  child: Text("MATH",
                      style: TextStyle(
                          fontFamily: "IriGrov",
                          fontSize: 40,
                          color: Color(0xffff5151))),
                )),
            const Positioned(
                left: 117,
                bottom: 110,
                child: SizedBox(
                  width: 150,
                  height: 90,
                  child: Text("for Kids",
                      style: TextStyle(
                          fontFamily: "IriGrov",
                          fontSize: 35,
                          color: Color(0xffff5151))),
                )),
            Positioned(
              left: 125,
              bottom: 70,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00ff57), // Background color
                  textStyle: const TextStyle(fontSize: 25, fontFamily: "IriGrov"),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const Greetings()));
                },
                child: const Text('Start'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
