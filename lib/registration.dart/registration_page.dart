import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:email_validator/email_validator.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override 
  State<StatefulWidget> createState() {
    return _RegisterState();
  }
}

class _RegisterState extends State<Register> {
  final _formKey = GlobalKey<FormBuilderState>();
  final _name = RegExp(r"^[a-zA-Z]+$");
  final _username = RegExp(r"^(?=.{8,20}$)(?![_.])(?!.*[_.]{2})[a-zA-Z0-9._]+(?<![_.])$");
  final _password = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  Widget build(BuildContext context) {
    return FormBuilder(
      key: _formKey,
      child: Column(
        children: [
          FormBuilderTextField(
            name: "Name", 
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter your first name";
              } else if (_name.hasMatch(value) == false) {
                return "Please enter a valid name";
              }
            },
          ),
          FormBuilderTextField(
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
            name: "Password",
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a password name";
              } else if (_password.hasMatch(value) == false) {
                return "Passwords should have at least one uppercase and lowercase letter, one number and one special character";
              }
              _formKey.currentState!.fields["Password"]!.save();
            },
          ),
          FormBuilderTextField(
            name: "Confirm Password", 
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a password name";
              } else if (_formKey.currentState!.fields["Password"]!.value != value) {
                return "Passwords are not matching";
              }
            }
          ),
          ElevatedButton(
            onPressed: () {
              final _valid = _formKey.currentState!.validate();
              if (_valid) {
                _formKey.currentState!.save();
              }
            }, 
            child: const Text("Register"))
        ],)
    );
  }
}