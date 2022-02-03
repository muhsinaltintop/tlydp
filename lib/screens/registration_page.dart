import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tlydp/backend_utils/api.dart';
import 'package:tlydp/backend_utils/model.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/login_screen.dart';
import 'package:tlydp/screens/profile_screen.dart';
import 'package:tlydp/backend_utils/globals.dart';
import 'package:tlydp/widgets/app_button.dart';

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
  String errorMessage = "";

  Future<UserModel> registerUser(String userName, String firstName,
    String lastName, String password, String email) async {
    final data = {
      "user_name": userName,
      "first_name": firstName,
      "last_name": lastName,
      "password": password,
      "email": email,
      "profile_pic": "https://t4.ftcdn.net/jpg/02/15/84/43/360_F_215844325_ttX9YiIIyeaR7Ne6EaLLjMAmy4GvPC69.jpg"
    };
    final response = await CallApi().postData(data, "users/register");
    final responseBody = response.body;

    if (response.statusCode == 201) {
      Map<String, dynamic> userResponse = jsonDecode(responseBody);
      final userObject = userResponse["user"];
      return UserModel(
        userObject["user_id"],
        userObject["user_name"],
        userObject["first_name"],
        userObject["last_name"],
        userObject["password"],
        userObject["email"],
        userObject["profile_pic"],
      );
    } else {
      Map<String, dynamic> error = jsonDecode(responseBody);
      setState(() {
        errorMessage = error["msg"];
      });
      throw Exception(errorMessage);
    }
  }

  displayError() {
    return errorMessage != ""
        ? Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              errorMessage,
              style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
            )
          )
        : const Text("");
  }

  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 140, 221, 240),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                  constraints: const BoxConstraints(maxHeight: 50),
                  iconSize: 120,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => LandingScreen()));
                  },
                  icon: Image.asset("images/back-button.png"),
                )
              ),
              FormBuilder(
                key: _formKey,
                child: Align(
                  alignment: Alignment.center,
                  child: Column(
                  children: [
                    Padding(
                    padding: const EdgeInsets.fromLTRB(20, 35, 20, 15),
                      child: Container(
                        child: const Text('TLYDP',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: "CherryBomb",
                            fontSize: 72,
                            color: Color.fromARGB(255, 185, 137, 109)
                          )
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
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
                      )
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
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
                      )
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
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
                      )
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
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
                      )
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          )
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
                      )
                    )),
                    Padding(
                      padding: const EdgeInsets.all(8),
                      child: SizedBox(
                      height: 40,
                      width: 250,
                      child: FormBuilderTextField(
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0)
                          ),
                          labelText: 'Confirm password',
                        ),
                        name: "Confirm Password",
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Please enter a matching password";
                          } else if (_formKey.currentState!.fields["Password"]!.value !=
                              value) {
                            return "Passwords are not matching";
                          }
                        },
                        obscureText: true,
                      )
                    )),
                    displayError(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                      child: AppButton(
                        text: "Register", 
                        onClick: () async {
                          final _valid = _formKey.currentState!.validate();
                          if (_valid) {
                            _formKey.currentState!.save();
                            final UserModel newUser = await registerUser(
                                _formKey.currentState!.fields["Username"]!.value,
                                _formKey.currentState!.fields["First Name"]!.value,
                                _formKey.currentState!.fields["Last Name"]!.value,
                                _formKey.currentState!.fields["Password"]!.value,
                                _formKey.currentState!.fields["Email"]!.value
                            );
                            setState(() {
                              currentUser = newUser;
                              loggedIn = true;
                                Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => ProfilePage()));
                              }
                            );
                          }
                        },
                      )
                    ),
                  InkWell(
                    child: const Text(
                      "Login instead", 
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(255, 7, 106, 163),
                        fontSize: 20,
                      ),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginScreen()),
                      );
                  }),
                ])
              )
            )
          ])
        )
      )
    );
  }
}
