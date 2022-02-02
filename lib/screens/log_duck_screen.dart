import 'package:flutter/material.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import '../widgets/app_button.dart';
import '../reusables/navbar/nav.dart';

class LogDuck extends StatefulWidget {
  const LogDuck({Key? key}) : super(key: key);

  @override
  _LogDuckState createState() {
    return _LogDuckState();
  }
}

class _LogDuckState extends State<LogDuck> {
  final _LogDuckKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _LogDuckKey,
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
              )
              ),
          centerTitle: true,
          backgroundColor: Colors.white70,
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: const Image(
                  image: AssetImage("assets/images/yellow-outlined-duck.png"),
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              );
            },
          ),
        ),
        drawer: MenuDrawer(),
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
                        height: 20,
                      ),


                      SizedBox(
                        height: 30,
                      ),
                      _imageDuck(),
                      SizedBox(
                        height: 30,
                      ),
                      _LogDuckLabel(),
                      SizedBox(
                        height: 30,
                      ),
                      _labelTextInput(
                          'Name of Duck', 'Name Your Duck Here', false),
                      SizedBox(
                        height: 30,
                      ),
                      _labelTextInput('Location', 'Location', false),
                      SizedBox(
                        height: 30,
                      ),
                      AppButton(
                        text: 'Upload Picture',
                        onClick: () {},
                        // Upload picture function will come here
                        // Will use image_picker plugin,
                      ),
                      SizedBox(
                        height: 30,
                      ),

                      _labelTextInput('Comments',
                          'Please make sure your clues are clear...', false),
                      SizedBox(
                        height: 30,
                      ),
                      AppButton(
                        text: 'Found',
                        onClick: () {
                          if (_LogDuckKey.currentState!
                              .validate()) {} // navigate to My Ducks
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Nav(),
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
    "assets/images/yellow-outlined-duck.png",
    width: 100,
  ));
}

Widget _LogDuckLabel() {
  return Center(
    child: Text('Log a Found Duck',
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
