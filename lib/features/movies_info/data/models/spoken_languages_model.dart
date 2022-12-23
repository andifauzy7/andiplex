class SpokenLanguagesModel {
  SpokenLanguagesModel({
    this.iso6391,
    this.name,
  });

  final String? iso6391;
  final String? name;

  factory SpokenLanguagesModel.fromJson(Map<String, dynamic> json) =>
      SpokenLanguagesModel(
        iso6391: json["iso_639_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_639_1": iso6391,
        "name": name,
      };
}
