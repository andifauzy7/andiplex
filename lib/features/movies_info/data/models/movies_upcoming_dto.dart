// To parse this JSON data, do
//
//     final moviesNowPlayingDto = moviesNowPlayingDtoFromJson(jsonString);

import 'dart:convert';

import 'package:andiplex/features/movies_info/data/models/movies_info_model.dart';

MoviesUpcomingDTO moviesUpcomingDtoFromJson(String str) =>
    MoviesUpcomingDTO.fromJson(json.decode(str));

String moviesUpcomingDtoToJson(MoviesUpcomingDTO data) =>
    json.encode(data.toJson());

class MoviesUpcomingDTO {
  MoviesUpcomingDTO({
    this.page,
    this.results,
    this.dates,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<MoviesInfoModel>? results;
  final Dates? dates;
  final int? totalPages;
  final int? totalResults;

  factory MoviesUpcomingDTO.fromJson(Map<String, dynamic> json) =>
      MoviesUpcomingDTO(
        page: json["page"],
        results: List<MoviesInfoModel>.from(
            json["results"].map((x) => MoviesInfoModel.fromJson(x))),
        dates: Dates.fromJson(json["dates"]),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
        "dates": dates?.toJson(),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}

class Dates {
  Dates({
    this.maximum,
    this.minimum,
  });

  final DateTime? maximum;
  final DateTime? minimum;

  factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: DateTime.parse(json["maximum"]),
        minimum: DateTime.parse(json["minimum"]),
      );

  Map<String, dynamic> toJson() => {
        "maximum":
            "${maximum?.year.toString().padLeft(4, '0')}-${maximum?.month.toString().padLeft(2, '0')}-${maximum?.day.toString().padLeft(2, '0')}",
        "minimum":
            "${minimum?.year.toString().padLeft(4, '0')}-${minimum?.month.toString().padLeft(2, '0')}-${minimum?.day.toString().padLeft(2, '0')}",
      };
}
