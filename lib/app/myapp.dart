import 'package:flutter/material.dart';
import 'package:mathforkids/app/screens/greetings.dart';
import '../app/screens/interface.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Interface(),
    );
  }
}
