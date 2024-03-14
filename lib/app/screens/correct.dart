import 'dart:async';
import 'dart:math'; // Import 'dart:math' to use Random class
import 'package:flutter/material.dart';

class CorrectPage extends StatelessWidget {
  CorrectPage({Key? key}) : super(key: key);

  final List<String> greetings = [
    "Yay, you've got it right!",
    "Congratulations, correct answer!",
    "Well done, you nailed it!",
    "Great job, keep it up!",
    "Fantastic, you're correct!"
  ];
  final List<String> images = [
    "assets/images/boba.png",
    "assets/images/nicoAvocado.png"
  ];

  @override
  Widget build(BuildContext context) {
    final String randomGreeting = greetings[Random().nextInt(greetings.length)];
    final String randomImage = images[Random().nextInt(images.length)];

    return Scaffold(
      body: Center(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Color(0xfff4eeee)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                randomImage,
                width: 150,
              ),
              SizedBox(
                height: 30,
              ),
              Text(randomGreeting,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xff21ff91),
                    fontFamily: 'IriGrov',
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

void showPage(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CorrectPage()),
  );

  Timer(const Duration(seconds: 1), () {
    Navigator.pop(context);
  });
}
