import 'package:flutter/material.dart';

class BadgeWidget extends StatelessWidget {
  // const BadgeWidget({Key? key, Icon icon, Future<Null> Function() onClicked}) : super(key: key);

  @override
  Widget build(BuildContext context) =>IntrinsicHeight(
    child: 
        buildButton(context, "10", "Duck Detective"),
      
  );
    Widget buildDivider() => Container(
      height: 24, 
      child: VerticalDivider(),
      );

  Widget buildButton(BuildContext context, String value, String text) => (
    MaterialButton(
      padding: EdgeInsets.symmetric(vertical: 4),
        onPressed: () {},
        materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text(
              value,
              style: TextStyle(color: Colors.red, fontWeight: FontWeight.w800),
            ),
            SizedBox(height: 2),
            Text(
              text,
              style: TextStyle(color: Colors.deepOrange, fontWeight: FontWeight.w800),
            )
          ],
        ),
      ));
}
