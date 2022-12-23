class GenreModel {
  GenreModel({
    this.id,
    this.name,
  });

  final int? id;
  final String? name;

  factory GenreModel.fromJson(Map<String, dynamic> json) => GenreModel(
        id: json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
