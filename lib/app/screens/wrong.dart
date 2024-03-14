import 'dart:async';
import 'dart:math'; // Import 'dart:math' to use Random class
import 'package:flutter/material.dart';

class CorrectPage extends StatelessWidget {
  CorrectPage({Key? key}) : super(key: key);

  final List<String> encouragements = [
    "Don't worry, mistakes happen. Try again!",
    "You're doing great! Try one more time!",
    "You're getting there! Keep trying!",
    "You're awesome! Try again and you'll get it!",
    "You're learning something new! Try again!",
    "It's okay to make mistakes. Keep trying!",
    "You're doing better with each try. Try again!",
    "You're almost there! Try one more time!",
    "You're a superstar! Keep trying!",
    "Mistakes help us learn. Try again!",
  ];
  final List<String> images = [
    "assets/images/cody.png",
    "assets/images/nina2.png"
  ];

  @override
  Widget build(BuildContext context) {
    final String randomGreeting =
        encouragements[Random().nextInt(encouragements.length)];
    final String randomImage = images[Random().nextInt(images.length)];

    return Scaffold(
      body: Center(
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
                  color: Color(0xffff5151),
                  fontFamily: 'IriGrov',
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                )),
          ],
        ),
      ),
    );
  }
}

void showPage2(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => CorrectPage()),
  );

  Timer(const Duration(seconds: 1), () {
    Navigator.pop(context);
  });
}
