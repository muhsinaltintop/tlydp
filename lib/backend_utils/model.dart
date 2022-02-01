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


class DuckModel {
    DuckModel(
        this.duckName,
        this.location,
        this.clues,
    );

    String duckName;
    String location;
    String clues;
    
}