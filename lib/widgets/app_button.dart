// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final String text;
  VoidCallback onClick;

  AppButton({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text(text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            )),
        onPressed: () {
          return onClick();
        },
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(250, 70),
          primary: Color.fromARGB(255, 223, 105, 8),
        ));
  }
}
