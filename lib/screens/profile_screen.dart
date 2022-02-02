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
          appBar: AppBar(
          title: Text(
          'TLYDP',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white70,
        centerTitle: true,
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
            ProfileWidget(
              imagePath: currentUser.profilePic,
              onClicked: () {},
            ),
            const SizedBox(height: 24),
            buildName(currentUser),
            const SizedBox(height: 50),
            Center(
                child: AppButton(
                    text: "Ducks I've Found",
                    onClick: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DuckFinds()));
                })),
            const SizedBox(height: 50),
            Center(child: AppButton(text: "Ducks I've Made", onClick: () {
              Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => DuckMakes()));
            }),
            ),
            const SizedBox(height: 30),
            Nav()
          ],
        ),
      ),
    );
  }

  Widget buildName(UserModel user) => Column(
        children: [
          Text(
            user.userName,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 17, 105, 7),
            ),
          )
        ],
      );
}
