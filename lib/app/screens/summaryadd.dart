import 'package:flutter/material.dart';
import 'addition.dart';
import '../../classes/sharedprefs.dart';
import 'dart:math';

class AdditionCalced extends StatefulWidget {
  const AdditionCalced({Key? key}) : super(key: key);

  @override
  State<AdditionCalced> createState() => _AdditionCalcedState();
}

class _AdditionCalcedState extends State<AdditionCalced> {
  final SharedPreferencesManager _sharedPreferencesManager = SharedPreferencesManager();
  int correctAnswers = 0;

  @override
  void initState() {
    super.initState();
    _loadCorrectAnswers();
  }

  // Load the correct answers count from SharedPreferences
  void _loadCorrectAnswers() async {
    correctAnswers = await _sharedPreferencesManager.getCorrectAnswers();
    setState(()  {
      
    });
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
    final String message = _generateMessage(correctAnswers);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: const Icon(Icons.home_filled), onPressed: () {}),
        title: const Text("Results", style: TextStyle(fontFamily: 'IriGrov'),),
        centerTitle: true,
        backgroundColor: const Color(0xffff5151),
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
              "$correctAnswers out of 10",
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
                        builder: (context) => const Addition(),
                      ));
                },
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(const Color(0xffff5151))),
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

  String _generateMessage(int correctAnswers) {
    if (correctAnswers == 10) {
      return "Great job! You got them all correct!";
    } else if (correctAnswers >= 7) {
      return "Very good! Keep up the good work!";
    } else if (correctAnswers > 0) {
      return messages[Random().nextInt(messages.length)];
    } else {
      return "Try again! You can do it!";
    }
  }
}
