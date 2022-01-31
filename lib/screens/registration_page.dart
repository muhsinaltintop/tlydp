import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/login_screen.dart';
import 'package:tlydp/screens/profile_screen.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override 
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _names = RegExp(r"^[a-zA-Z]+$");
  final _username = RegExp(r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
  final _password = RegExp(r"^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$");
  late final currentUser;
  String errorMessage = "";


  Future<UserModel?> registerUser(String userName, String firstName, String lastName, String password, String email) async {
    final data = {
      "user_name": userName,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "email": email,
      "profile_pic": "https://robohash.org/autetdolorum.png?size=50x50&set=set1"
    };
    final response = await CallApi().postUser(data, "register");
    final responseBody = response.body;

    if (response.statusCode == 201) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => const ProfilePage()),
      // );
      Map<String, dynamic> userResponse = jsonDecode(responseBody);
      final userObject = userResponse["user"];
      return UserModel(
        userObject["user_name"],
        userObject["first_name"],
        userObject["last_name"],
        userObject["password"],
        userObject["email"],
        userObject["profile_pic"],
      );
    }
    else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      errorMessage = error["msg"];
      return null;
    }
  }

  displayError() {
    return errorMessage != "" ? Text(errorMessage, style: const TextStyle(color: Colors.red),) : const Text("");
  }

  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingScreen()),
              );
            },
          ),
          FormBuilder(
          key: _formKey,
          child: Column(
            children: [
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'First Name',
                ),
                name: "First Name", 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your first name";
                  } else if (_names.hasMatch(value) == false) {
                    return "Please enter a valid name";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Last Name',
                ),
                name: "Last Name", 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your last name";
                  } else if (_names.hasMatch(value) == false) {
                    return "Please enter a valid name";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
                name: "Email", 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter your email";
                  } else if (EmailValidator.validate(value) == false) {
                    return "Please enter a valid email";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Username',
                ),
                name: "Username",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a username";
                  } else if (_username.hasMatch(value) == false) {
                    return "Please enter another username";
                  }
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                name: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password";
                  } else if (_password.hasMatch(value) == false) {
                    return "Passwords should be at least eight characters long with one uppercase \nletter, one lowercase letter and one number";
                  }
                  _formKey.currentState!.fields["Password"]!.save();
                },
                obscureText: true,
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Confirm password',
                ),
                name: "Confirm Password", 
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password name";
                  } else if (_formKey.currentState!.fields["Password"]!.value != value) {
                    return "Passwords are not matching";
                  }
                },
                obscureText: true,
              ),
              displayError(),
              ElevatedButton(
                onPressed: () async {
                  final _valid = _formKey.currentState!.validate();
                  if (_valid) {
                    _formKey.currentState!.save();

                    final UserModel? newUser = await registerUser(
                      _formKey.currentState!.fields["Username"]!.value,
                      _formKey.currentState!.fields["First Name"]!.value,
                      _formKey.currentState!.fields["Last Name"]!.value,
                      _formKey.currentState!.fields["Password"]!.value,
                      _formKey.currentState!.fields["Email"]!.value
                    );

                    setState(() {
                      if (newUser != null) {
                        currentUser = newUser;
                      }
                    });
                  }
                }, 
                child: const Text("Register")),
                InkWell(
                  child: const Text("Login instead"),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const LoginScreen()),
                    );
                  }
            ),
            ],)
        )]
      )
    );
  }
}