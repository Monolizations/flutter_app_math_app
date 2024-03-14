import 'package:flutter/material.dart';

class NumButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final Color c;

  const NumButton({
    required this.text,
    required this.onPressed,
    required this.c,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
            fontSize: 24,
            fontFamily: "IriGrov"), // Customize the text style as needed
      ),
      style: ButtonStyle(
        backgroundColor:  MaterialStateProperty.all<Color>(c),
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.all(16)),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)))


      )
    );
  }
}
