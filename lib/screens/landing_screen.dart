// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/widgets/app_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: Colors.white70,
            ),
            child: Text('The Little Yellow Duck Project',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 30, shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  )
                ])),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AppButton(text: 'About us'),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AppButton(text: 'Login'),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AppButton(text: 'Create an account'),
          ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: AppButton(text: 'View map'),
          ),
        ],
      ),
    )));
  }
}
