import 'package:flutter/material.dart';
import 'package:mathforkids/app/screens/homescreen.dart';
import '../../classes/numbers.dart';
import '../clippath/customclip2.dart';
import '../widgets/widgets.dart';
import 'correct.dart';
import 'wrong.dart';
import 'summaryadd.dart';
import '../../classes/sharedprefs.dart'; 

class Addition extends StatefulWidget {
  const Addition({Key? key}) : super(key: key);

  @override
  State<Addition> createState() => _AdditionState();
}

class _AdditionState extends State<Addition> {

  SharedPreferencesManager _sharedPreferencesManager = SharedPreferencesManager();

  late int x;
  late int y;
  late int z;
  int progress = 1;
  int correctAnswers = 0;


  TextEditingController answerField = TextEditingController();

  @override
  void initState() {
    super.initState();

    // Retrieve the correct answers count from SharedPreferences
    _loadCorrectAnswers();

    Numbers num = Numbers();

    x = num.generateNumber(20);
    y = num.generateNumber(20);
    z = x + y;
  }

  // Load the correct answers count from SharedPreferences
  void _loadCorrectAnswers() async {
    correctAnswers = await _sharedPreferencesManager.getCorrectAnswers();
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
        title: Text("Addition"),
        backgroundColor: Color(0xffff5151),
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
                    color: index < progress ? Color(0xffff5151) : Colors.white,
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
                    "$x + $y = ",
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
                        color: Color(0xffff5151),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    right: 30,
                    child: Image.asset(
                      "assets/images/bingo.png",
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
                              }, c: Color(0xffff5151),),
                              
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "2",
                            onPressed: () {
                              answerField.text += '2';
                            }, c: Color(0xffff5151),
                            
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "3",
                            onPressed: () {
                              answerField.text += '3';
                            },
                            c: Color(0xffff5151),
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
                              c: Color(0xffff5151),),
                              
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "5",
                            onPressed: () {
                              answerField.text += '5';
                            },
                            c:Color(0xffff5151),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "6",
                            onPressed: () {
                              answerField.text += '6';
                            },
                            c: Color(0xffff5151),
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
                              },c: Color(0xffff5151),
                              ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "8",
                            onPressed: () {
                              answerField.text += '8';
                            },c: Color(0xffff5151),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(2.0),
                          child: NumButton(
                            text: "9",
                            onPressed: () {
                              answerField.text += '9';
                            },c: Color(0xffff5151),
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
                        },c: Color(0xffff5151),),
                  ),
                  Positioned(
                    left: 220,
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Ink(
                        decoration: ShapeDecoration(
                            color: Color(0xffff5151),
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
                                  color: Color(0xffff5151))),
                        ),
                        onPressed: () {
                          setState(() {
                            Numbers n = Numbers();

                            if (answerField.text.isNotEmpty) {
                              if (int.parse(answerField.text) == z) {
                                x = n.generateNumber(20);
                                y = n.generateNumber(20);

                                z = x + y;

                                answerField.clear();
                                progress++;
                                correctAnswers++;
                                _sharedPreferencesManager.setCorrectAnswers(correctAnswers); // Save correct answers count
                                showPage(context);
                              } 
                              else {
                                x = n.generateNumber(10);
                                y = n.generateNumber(15);

                                z = x + y;

                                answerField.clear();

                                showPage2(context);
                                progress++;
                              }
                            }else{
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
                                            const AdditionCalced()));

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
