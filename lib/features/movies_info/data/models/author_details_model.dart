class AuthorDetailsModel {
  AuthorDetailsModel({
    this.name,
    this.username,
    this.avatarPath,
    this.rating,
  });

  final String? name;
  final String? username;
  final String? avatarPath;
  final double? rating;

  factory AuthorDetailsModel.fromJson(Map<String, dynamic> json) =>
      AuthorDetailsModel(
        name: json["name"],
        username: json["username"],
        avatarPath: json["avatar_path"],
        rating: json["rating"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "username": username,
        "avatar_path": avatarPath,
        "rating": rating,
      };
}
