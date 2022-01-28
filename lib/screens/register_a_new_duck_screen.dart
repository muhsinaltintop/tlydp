import 'package:flutter/material.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'landing_screen.dart';

class RegisterDuck extends StatefulWidget {
  const RegisterDuck({Key? key}) : super(key: key);

  @override
  _RegisterDuckState createState() {
    return _RegisterDuckState();
  }
}

class _RegisterDuckState extends State<RegisterDuck> {
  final _registerDuckKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _registerDuckKey,
      child: Scaffold(
        appBar: AppBar(
          title: Text("TLYDP",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    offset: Offset(1.0, 1.0),
                    blurRadius: 2.0,
                    color: Colors.grey,
                  ),
                ],
              )),
          centerTitle: true,
          backgroundColor: Colors.white70,
        ),
        backgroundColor: Colors.amber,
        body: SingleChildScrollView(
            child: SizedBox(
          child: Stack(children: [
            SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      _imageDuck(),
                      SizedBox(
                        height: 70,
                      ),
                      _registerDuckLabel(),
                      SizedBox(
                        height: 70,
                      ),
                      _labelTextInput(
                          'Name of Duck', 'Name Your Duck Here', false),
                      SizedBox(
                        height: 70,
                      ),
                      _labelTextInput('Location', 'Location', false),
                      SizedBox(
                        height: 90,
                      ),
                      _labelTextInput('Clues',
                          'Please make sure your clues are clear...', false),
                      SizedBox(
                        height: 90,
                      ),
                      AppButton(
                        text: 'Send Out to the World',
                        onClick: () {
                          if (_registerDuckKey.currentState!
                              .validate()) {} // navigate to My Ducks
                        },
                      ),
                      SizedBox(
                        height: 70,
                      ),
                    ],
                  ),
                ))
          ]),
        )),
      ),
    );
  }
}

Widget _imageDuck() {
  return Center(
      child: Image.asset(
    "assets/images/aboutus-icon.png",
    width: 100,
  ));
}

Widget _registerDuckLabel() {
  return Center(
    child: Text('Register New Duck',
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.w700,
          fontSize: 34,
        )),
  );
}

Widget _labelTextInput(String label, String hintText, bool isPassword) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyle(
          color: Color.fromARGB(255, 17, 105, 7),
          fontWeight: FontWeight.w600,
          fontSize: 20,
        ),
      ),
      TextFormField(
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'This field cannot be empty';
          }
          return null;
        },
        obscureText: isPassword,
        cursorColor: Color.fromARGB(255, 22, 136, 7),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            color: Color.fromARGB(188, 136, 172, 139),
            fontWeight: FontWeight.w400,
            fontSize: 20,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffdfe8f3)),
          ),
        ),
      ),
    ],
  );
}
