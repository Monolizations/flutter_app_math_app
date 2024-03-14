import 'package:flutter/material.dart';
import 'package:mathforkids/app/screens/homescreen.dart';
import '../../classes/numbers.dart';
import '../clippath/customclip2.dart';
import '../widgets/widgets.dart';
import 'correct.dart';
import 'wrong.dart';
import 'summarymul.dart'; 
import '../../classes/sharedprefs.dart';

class Multiplication extends StatefulWidget {
  const Multiplication({Key? key}) : super(key: key);

  @override
  State<Multiplication> createState() => _MultiplicationState();
}

class _MultiplicationState extends State<Multiplication> {
  late int x;
  late int y;
  late int z;
  int progress = 1;
   int correctAnswer = 0;

   SharedPreferencesManager _sharedPreferencesManager = SharedPreferencesManager();

  TextEditingController answerField = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Retrieve the correct answers count from SharedPreferences
    _loadCorrectAnswers();

    Numbers num = Numbers();

    x = num.generateNumber(10);
    y = num.generateNumberforSubtraction(0,x);
    z = x * y; 
  }

  // Load the correct answers count from SharedPreferences
  void _loadCorrectAnswers() async {
    correctAnswer = await _sharedPreferencesManager.getCorrectAnswers();
    setState(() {});
  }



  @override
  Widget build(BuildContext context) {
    double screenW = MediaQuery.of(context).size.width;
    double screenH = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomeScreen(),
                  ));
            }),
        title: Text("Multiplication"), // Changed title
        backgroundColor: const Color(0xff57ebff),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                10,
                (index) => Container(
                  width: (screenW - 50) / 10,
                  height: 10,
                  margin: EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                      width: 1,
                    ),
                    color: index < progress ? const Color(0xff57ebff) : Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 80,
                  child: Text(
                    "$x x $y = ", 
                    style: TextStyle(fontSize: 40, fontFamily: 'IriGrov'),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: 90,
                  width: 90, // Adjusted width to accommodate the TextField
                  child: AbsorbPointer(
                    absorbing: true,
                    child: TextField(
                      style: TextStyle(fontFamily: 'IriGrov', fontSize: 38),
                      controller: answerField,
                      textAlign: TextAlign
                          .center, // Center aligns the text inside the TextField
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: EdgeInsets.all(10.0),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              height: (screenH * 0.6) - 20,
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: ClipPath(
                      clipper: GamePageClip(),
                      child: Container(
                        width: screenW,
                        height: 236,
                        color: const Color(0xff57ebff),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 30,
                    child: Image.asset(
                      "assets/images/jojo.png",
                      width: 120,
                    ),
                  ),
                  Positioned(
                    left: 30,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: NumButton(
                              text: "1",
                              onPressed: () {
                                answerField.text += '1';
                              },c: const Color(0xff57ebff),),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "2",
                            onPressed: () {
                              answerField.text += '2';
                            },c: const Color(0xff57ebff)
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "3",
                            onPressed: () {
                              answerField.text += '3';
                            },c: const Color(0xff57ebff),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 55,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: NumButton(
                            text: "4",
                            onPressed: () {
                              answerField.text += '4';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "5",
                            onPressed: () {
                              answerField.text += '5';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "6",
                            onPressed: () {
                              answerField.text += '6';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 30,
                    top: 110,
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: NumButton(
                            text: "7",
                            onPressed: () {
                              answerField.text += '7';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "8",
                            onPressed: () {
                              answerField.text += '8';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "9",
                            onPressed: () {
                              answerField.text += '9';
                            },
                            c: const Color(0xff57ebff),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    left: 92,
                    top: 165,
                    child: NumButton(
                      text: "0",
                      onPressed: () {
                        answerField.text += '0';
                      },
                      c: const Color(0xff57ebff),
                    ),
                  ),
                  Positioned(
                    left: 220,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Ink(
                        decoration: ShapeDecoration(
                            color: const Color(0xff57ebff),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                spreadRadius: 1,
                                blurRadius: 2,
                                offset: Offset(0, 2),
                              ),
                            ]),
                        child: IconButton(
                          icon: Icon(Icons.backspace_rounded,
                              color: Colors.white),
                          onPressed: () {
                            setState(() {
                              if (answerField.text.isNotEmpty) {
                                answerField.text = answerField.text
                                    .substring(0, answerField.text.length - 1);
                              }
                            });
                          },
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                      left: 30,
                      bottom: 30,
                      child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all<Color>(
                                Color(0xffffffff))),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text("Submit",
                              style: TextStyle(
                                  fontFamily: 'IriGrov',
                                  fontSize: 30,
                                  color: const Color(0xff57ebff))),
                        ),
                        onPressed: () {
                          setState(() {
                            Numbers n = Numbers();
                            if (answerField.text.isNotEmpty) {
                              if (int.parse(answerField.text) == z) {
                                x = n.generateNumberforSubtraction(1,5);
                                y = n.generateNumberforSubtraction(1,5);

                                z = x * y; 

                                answerField.clear();
                                progress++;
                                correctAnswer++;
                                _sharedPreferencesManager.setCorrectAnswers(correctAnswer); 
                                showPage(context);
                              } else if (answerField.text.isEmpty) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: Text("OOOPS"),
                                      content: Text("Enter a number first"),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('OK'),
                                        ),
                                      ],
                                    );
                                  }
                                );
                              }
                            else {
                              x = n.generateNumberforSubtraction(1,5);
                              y = n.generateNumberforSubtraction(1,5);

                              z = x * y; 

                              answerField.clear();

                              showPage2(context);
                              progress++;
                            }
                            } else{
                              showDialog(context: context, builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text("WOOOPPS"),
                                  content: Text("Enter a number"),
                                  actions: [
                                    TextButton(onPressed: (){
                                      Navigator.pop(context);
                                    }, child: Text("Ok"))
                                  ],
                                );
                              });
                            }
                            if (progress == 11) {
                              Future.delayed(
                                  Duration(seconds: 1, milliseconds: 1), () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                             MultiplicationCalced()));

                                Future.delayed(
                                    Duration(seconds: 1, milliseconds: 3), () {
                                  _sharedPreferencesManager.resetCorrectAnswers();
                                  progress = 1;
                                });
                              });
                            }
                          });
                        },
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
