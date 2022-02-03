// ignore_for_file: prefer_const_constructors

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppButton extends StatelessWidget {
  final String text;
  VoidCallback onClick;

  AppButton({Key? key, required this.text, required this.onClick}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        return onClick();
      },
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              offset: const Offset(-6, 6),
            ),
          ],
          border: Border.all(
            color: const Color.fromARGB(255, 185, 137, 109),
            width: 4
          ),
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(255, 241, 216, 129),
        ),
        width: 220,
        height: 60,
        child: Align(
          alignment: Alignment.center,
          child: AutoSizeText(text, 
            maxLines: 1,
            style: TextStyle(
              fontFamily: "CherryBomb",
              fontSize: 22,
              color: Color.fromARGB(255, 185, 137, 109),
            )
          )
        )
      )
    );
  }
}