import 'package:flutter/material.dart';

class TitleAppBar extends StatelessWidget {
  const TitleAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
        elevation: 0,
        title: const Center(
          child: Text("TLYDP",
            style: TextStyle(
              fontFamily: "CherryBomb",
              fontSize: 60,
              color: Color.fromARGB(255, 185, 137, 109)
            ),
          )
        ),
        backgroundColor: Colors.white.withOpacity(0.5),
      );
  }
}