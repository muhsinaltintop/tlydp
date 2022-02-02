// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tlydp/screens/my_duck_finds.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import '../widgets/app_button.dart';
import '../reusables/navbar/nav.dart';
import '../shared/search_appBar.dart';

class LogDuck extends StatefulWidget {
  const LogDuck({Key? key}) : super(key: key);

  @override
  _LogDuckState createState() {
    return _LogDuckState();
  }
}

class _LogDuckState extends State<LogDuck> {
  final _logDuckKey = GlobalKey<FormState>();
  final TextEditingController _locationQueryController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _logDuckKey,
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
                      _logDuckLabel(),
                      SizedBox(
                        height: 30,
                      ),
                      _labelTextInput(
                          'Name of Duck', 'Name Your Duck Here', false),
                      SizedBox(
                        height: 30,
                      ),
                      _labelTextInputLocation('Location', 'Location', false),
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
                      _labelTextInput(
                          'Comments', 'Describe your new duck!', false),
                      SizedBox(
                        height: 30,
                      ),
                      AppButton(
                        text: 'Found',
                        onClick: () {
                          if (_logDuckKey.currentState!.validate()) {
                            searchBarKey.currentState
                                ?.getNewCoords(_locationQueryController.text);
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => DuckFinds(),
                            ));
                          }
                        },
                      ),
                      SizedBox(
                        height: 30,
                      ),
                    ],
                  ),
                ))
          ]),
        )),
        bottomNavigationBar: Nav(),
      ),
    );
  }

  Widget _imageDuck() {
    return Center(
        child: Image.asset(
      "assets/images/yellow-outlined-duck.png",
      width: 100,
    ));
  }

  Widget _logDuckLabel() {
    return Center(
      child: Text('Log a Found Duck',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 34,
          )),
    );
  }

  Widget _labelTextInputLocation(
      String label, String hintText, bool isPassword) {
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
          controller: _locationQueryController,
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
}
