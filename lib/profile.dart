import 'package:flutter/material.dart';
import 'package:tlydp/model/user.dart';
import 'package:tlydp/utils/user_preferences.dart';
import 'package:tlydp/widgets/app_button.dart';
import 'package:tlydp/widgets/profile_widget.dart';
import 'package:tlydp/widgets/badge_widget.dart';
// import './screens/my_duck_finds.dart';
// import './screens/my_duck_makes.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

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
      ),
      body: Container(
        padding: EdgeInsets.all(20.0),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            ProfileWidget(
              imagePath: user.imagePath,
              onClicked: () async {
                //This will route to a new page that will have 2 buttons: "Take Picture and Upload Picture"
                //On this page will use "image_picker"
              },
            ),
            const SizedBox(height: 20),
            BadgeWidget(),
            const SizedBox(height: 24),
            buildName(user),
            const SizedBox(height: 24),
            Center(child: AppButton(text: 'Update Details', onClick: () {})),
            const SizedBox(height: 50),
            Center(
                child: AppButton(
                    text: "Ducks I've Found",
                    onClick: () {
                      // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => Duck_Finds()));
                ///AFTER MERGE OF DUCK FIND REMOVE THE COMMENTOUT
                    })),
            const SizedBox(height: 50),
            Center(child: AppButton(text: "Ducks I've Made", onClick: () {
              // Navigator.of(context).push(
                      //     MaterialPageRoute(builder: (context) => DuckMakes()));
                ///AFTER MERGE OF DUCK FIND REMOVE THE COMMENTOUT
            })),
          ],
        ),
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Color.fromARGB(255, 17, 105, 7),
            ),
          )
        ],
      );
}
