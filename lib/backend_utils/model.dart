import 'dart:convert';

class UserModel {
    UserModel(
        this.userName,
        this.firstName,
        this.lastName,
        this.password,
        this.email,
        this.profilePic,
    );

    String userName;
    String firstName;
    String lastName;
    String password;
    String email;
    String profilePic;
}

class LoginModel {
  LoginModel(
    this.username,
    this.passport,
  );


  String username;
  String passport;

}
