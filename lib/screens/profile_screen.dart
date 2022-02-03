// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/reusables/navbar/nav.dart';
import 'package:tlydp/screens/my_duck_finds.dart';
import 'package:tlydp/screens/my_duck_makes.dart';
import 'package:tlydp/shared/menu_drawer.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'package:tlydp/widgets/profile_widget.dart';
import 'package:tlydp/backend_utils/globals.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
          appBar: AppBar(
          title: Text("TLYDP",
              style: TextStyle(
                color: Color.fromARGB(255, 185, 137, 109),
                fontSize: 45,
                fontFamily: "CherryBomb",
              )),
          centerTitle: true,
          backgroundColor: Colors.white.withOpacity(0.5),
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
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 255, 112, 112),
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.25),
                    offset: const Offset(-6, 6)
                  )
                ],
              ),
              height: 200,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                children: [
                  ProfileWidget(
                    imagePath: currentUser.profilePic,
                    onClicked: () {},
                  ),
                  buildName(currentUser),
                ]))),
              const SizedBox(height: 40),
              const SizedBox(height: 30),
            Center(
                child: AppButton(
                    text: "Ducks I've Found",
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DuckFinds()));
                })),
            const SizedBox(height: 20),
            Center(child: AppButton(text: "Ducks I've Made", onClick: () {
              Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DuckMakes()));
            }),
            ),
            const SizedBox(height: 30),
            ],
        ),
      ),
      bottomNavigationBar: Nav(),
    );
  }

  Widget buildName(UserModel user) => Padding(
    padding: EdgeInsets.fromLTRB(25, 85, 0, 0),
    child: Column(
        children: [
          Text(
            user.userName,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          )
        ],
      ));
}
