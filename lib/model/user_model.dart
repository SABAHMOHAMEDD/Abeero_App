class UserModel {
  String? userId;

  String? name;
  String? email;
  String? userImage;

  UserModel({
    this.userId,
    this.name,
    this.email,
    this.userImage,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : this(
          userId: json['userId'],
          name: json['name'],
          email: json['email'],
          userImage: json['userImage'],
        );

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'userImage': userImage,
    };
  }
}
