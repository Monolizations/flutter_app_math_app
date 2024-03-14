import 'package:flutter/material.dart';
import 'package:mathforkids/app/screens/homescreen.dart';
import 'package:mathforkids/classes/sharedprefs.dart';


class Greetings extends StatefulWidget {
  const Greetings({super.key});

  @override
  State<Greetings> createState() => _GreetingsState();
}



class _GreetingsState extends State<Greetings> {
  SharedPreferencesManager _sharedPreferencesManager = SharedPreferencesManager();

  TextEditingController nem = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double screenH = MediaQuery.of(context).size.height;
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            Container(
              height: screenH * 0.6,
              child: Stack(
                children: [
                  Positioned(
                    left: 30,
                    top: 70,
                    child: Image.asset("assets/images/bubble.png", width: screenH * 0.2,)
                  ),
                  Positioned(
                    right: 30,
                    top: 60,
                    child: Image.asset("assets/images/nina.png", width: screenH * 0.173)
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Text("Your Name:", textAlign: TextAlign.start, style: TextStyle(fontFamily:'IriGrov',fontWeight: FontWeight.bold, fontSize: 28),),
                SizedBox(height: 20,),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: TextField(
                    style: TextStyle(fontFamily: 'IriGrov', fontSize: 38),
                    controller: nem,
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
                SizedBox(height: 20,),
                ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff00ff57), // Background color
                  textStyle: const TextStyle(fontSize: 25, fontFamily: "IriGrov"),
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                ),
                onPressed: () {
                  if (nem.text.isNotEmpty) {
                    _sharedPreferencesManager.setPlayerName(nem.text);
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const HomeScreen()));
                  } else {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Enter a name first"),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('OK'),
                            ),
                          ],
                        );
                      },
                    );
                  }
                },
                child: const Text('Start'),
              ),
              ],
            )
          ],
        ),
      ),
    );
  }
}