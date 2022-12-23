class ProductionCountriesModel {
  ProductionCountriesModel({
    this.iso31661,
    this.name,
  });

  final String? iso31661;
  final String? name;

  factory ProductionCountriesModel.fromJson(Map<String, dynamic> json) =>
      ProductionCountriesModel(
        iso31661: json["iso_3166_1"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
      };
}
