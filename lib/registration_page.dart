// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return RegisterState();
  }
}

class RegisterState extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  late String firstName;
  late String lastName;
  late String email;
  late String username;
  late String password;
  late String profilePicture;

  Widget buildFirstName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "First Name"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        firstName = value!;
      },
    );
  }

  Widget buildLastName() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Last Name"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        lastName = value!;
      },
    );
  }

  Widget buildEmail() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Email"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget buildUsername() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Username"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        username = value!;
      },
    );
  }

  Widget buildPassword() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        password = value!;
      },
    );
  }

  Widget buildProfilePicture() {
    return TextFormField(
      decoration: const InputDecoration(labelText: "Profile Picture URL"),
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return "Required field";
        }
      },
      onSaved: (value) {
        profilePicture = value!;
      },
    );
  }

  @override
  Widget build(BuildContext context) {    
        return Form(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, 
            children: <Widget>[
              buildFirstName(),
              buildLastName(),
              buildEmail(),
              buildUsername(),
              buildPassword(),
              buildProfilePicture(),
              const SizedBox(height: 130),
              ElevatedButton(
                child: const Text(
                  "Submit", 
                  style: TextStyle(color: Colors.white, fontSize: 16)), 
                  onPressed: () {
                    if (_formKey.currentState?.validate() ?? true) {
                      return;
                    }
                    _formKey.currentState!.save();
                    print(firstName);
                    print(lastName);
                    print(email);
                    print(username);
                    print(password);
                    print(profilePicture);
                  },
              )
            ],
          )
        );
  }
}