import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:email_validator/email_validator.dart';
import 'package:tlydp/screens/landing_screen.dart';
import 'package:tlydp/screens/login_screen.dart';
import 'package:http/http.dart' as http;

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override 
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _username = RegExp(r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
  final _password = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  registerUser(user_name, first_name, last_name, password, email) async {
      try {
        final response = await http.post(
          Uri.parse("https://tlydp.herokuapp.com/api/users/register"),
          body: {
            "user_name": user_name,
            "first_name": first_name,
            "last_name": last_name,
            "password": password,
            "email": email,
            "profile_pic": "https://robohash.org/autetdolorum.png?size=50x50&set=set1",
          }
        );
        print(response.body);
      } catch (e) {
        print(e);
      }
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
                  // Get usernames from backend to check username is not already taken
                },
              ),
              FormBuilderTextField(
                decoration: const InputDecoration(
                  labelText: 'Password',
                ),
                name: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a password name";
                  } else if (_password.hasMatch(value) == false) {
                    return "Passwords should have at least one uppercase and lowercase letter, \none number and one special character";
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
              ElevatedButton(
                onPressed: () {
                  final _valid = _formKey.currentState!.validate();
                  if (_valid) {
                    _formKey.currentState!.save();
                    registerUser(
                    _formKey.currentState!.fields["Username"]!.value,
                    _formKey.currentState!.fields["First Name"]!.value,
                    _formKey.currentState!.fields["Last Name"]!.value,
                    _formKey.currentState!.fields["Password"]!.value,
                    _formKey.currentState!.fields["Email"]!.value
                    );
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