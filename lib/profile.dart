import 'package:flutter/material.dart';
import 'package:tlydp/model/user.dart';
import 'package:tlydp/utils/user_preferences.dart';
import 'package:tlydp/widgets/appbar_widget.dart';
import 'package:tlydp/widgets/profile_widget.dart';
import 'package:tlydp/widgets/button_widget.dart';
import 'package:tlydp/widgets/link_button_widget.dart';
import 'package:tlydp/widgets/badge_widget.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    const user = UserPreferences.myUser;

    return Scaffold(
      appBar: buildAppBar(context),
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          ProfileWidget(
            imagePath: user.imagePath,
            onClicked: () async {},
          ),

          BadgeWidget(),


          const SizedBox(height: 24),
          buildName(user),

          const SizedBox(height: 24),
          Center(child: buildEditDetailsButton()),

          const SizedBox(height: 50),
          Center(child: foundDuckButton()),

          const SizedBox(height: 50),
          Center(child: madeDuckButton()),
        ],
      ),
    );
  }

  Widget buildName(User user) => Column(
        children: [
          Text(
            user.username,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
          )
        ],
      );

      Widget buildEditDetailsButton() => ButtonWidget(
        text: 'Update Details',
        onClicked: () {},
      );

      Widget foundDuckButton() => LinkButtonWidget(
        text: "Ducks I've Found",
        onClicked: () {},
      );

      Widget madeDuckButton() => LinkButtonWidget(
        text: "Ducks I've Made",
        onClicked: () {},
      );



}
