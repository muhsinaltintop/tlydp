import 'dart:convert';

NewUserModel newUserModelFromJson(String str) => NewUserModel.fromJson(json.decode(str));

String newUserModelToJson(NewUserModel data) => json.encode(data.toJson());

class NewUserModel {
    NewUserModel({
        required this.userName,
        required this.firstName,
        required this.lastName,
        required this.password,
        required this.email,
        required this.profilePic,
    });

    String userName;
    String firstName;
    String lastName;
    String password;
    String email;
    String profilePic;

    factory NewUserModel.fromJson(Map<String, dynamic> json) => NewUserModel(
        userName: json["user_name"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        password: json["password"],
        email: json["email"],
        profilePic: json["profile_pic"],
    );

    Map<String, dynamic> toJson() => {
        "user_name": userName,
        "first_name": firstName,
        "last_name": lastName,
        "password": password,
        "email": email,
        "profile_pic": profilePic,
    };
}
