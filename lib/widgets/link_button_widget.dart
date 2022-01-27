import 'package:flutter/material.dart';

class LinkButtonWidget extends StatelessWidget {
  final String text;
  final VoidCallback onClicked;

  const LinkButtonWidget({
    Key? key,
    required this.text,
    required this.onClicked,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape:  new RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
        onPrimary: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20)
      ),
      child: Text(text),
      onPressed: onClicked,
    );
  }
}
