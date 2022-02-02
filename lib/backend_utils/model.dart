class UserModel {
    UserModel(
        this.userId,
        this.userName,
        this.firstName,
        this.lastName,
        this.password,
        this.email,
        this.profilePic,
    );

    int userId;
    String userName;
    String firstName;
    String lastName;
    String password;
    String email;
    String profilePic;
}

class DuckModel {
    DuckModel(
        this.duckId,
        this.duckName,
        this.makerId,
        this.finderId,
        this.locationPlacedLat,
        this.locationPlacedLng,
        this.locationFoundLat,
        this.locationFoundLng,
        this.clue,
        this.image,
        this.comments,
        this.makerName,
        this.finderName
    );

    int duckId;
    String duckName;
    int makerId;
    int? finderId;
    double locationPlacedLat;
    double locationPlacedLng;
    double? locationFoundLat;
    double? locationFoundLng;
    String clue;
    String? image;
    String? comments;
    String makerName;
    String? finderName;
}