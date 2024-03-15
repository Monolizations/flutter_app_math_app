import 'package:flutter/material.dart';
import 'subtraction.dart';
import '../../classes/sharedprefs.dart';
import 'dart:math';
import 'homescreen.dart';

class SubtractionCalced extends StatefulWidget {
  const SubtractionCalced({Key? key}) : super(key: key);

  @override
  State<SubtractionCalced> createState() => _SubtractionCalcedState();
}

class _SubtractionCalcedState extends State<SubtractionCalced> {
  SharedPreferencesManager _sharedPreferencesManager =
      SharedPreferencesManager();
  int correctAnswer = 0; // Changed variable name

  @override
  void initState() {
    super.initState();
    _loadcorrectAnswer(); // Corrected function name
  }

  // Load the correct answers count from SharedPreferences
  void _loadcorrectAnswer() async {
    correctAnswer = await _sharedPreferencesManager.getCorrectAnswers();
    setState(() {});
  }

  final List<String> images = [
    "assets/images/dad.png",
    "assets/images/cece.png",
    "assets/images/bella.png",
  ];

  final List<String> messages = [
    "Keep going, you can do it!",
    "Great effort, let's keep practicing!",
    "Nice try, let's aim higher next time!",
    "You're on the right track, keep it up!",
    "Fantastic job, keep pushing yourself!",
    "Very good, keep improving!",
    "Awesome work, keep practicing!",
    "Well done, keep up the good work!",
    "You're doing great, keep it going!",
    "Excellent job, keep challenging yourself!"
  ];

  @override
  Widget build(BuildContext context) {
    final String randomImage = images[Random().nextInt(images.length)];
    final String message =
        _generateMessage(correctAnswer); // Changed variable name
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: const Icon(Icons.home_filled),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }),
        title: const Text("Results", style: TextStyle(fontFamily: 'IriGrov')),
        centerTitle: true,
        backgroundColor: const Color(0xffffe074),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  randomImage,
                  width: 130,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "$correctAnswer out of 10", // Changed variable name
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              message,
              style: const TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Subtraction(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                        const Color(0xffffe074))),
                child: const Text(
                  "Retry",
                  style: TextStyle(fontFamily: "IriGrov", fontSize: 28),
                  textAlign: TextAlign.center,
                ))
          ],
        ),
      ),
    );
  }

  String _generateMessage(int correctAnswer) {
    if (correctAnswer == 10) {
      return "Great job! You got them all correct!";
    } else if (correctAnswer >= 7) {
      return "Very good! Keep up the good work!";
    } else if (correctAnswer > 0) {
      return messages[Random().nextInt(messages.length)];
    } else {
      return "Try again! You can do it!";
    }
  }
}
