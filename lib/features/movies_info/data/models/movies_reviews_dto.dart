// To parse this JSON data, do
//
//     final moviesReviewsDto = moviesReviewsDtoFromJson(jsonString);

import 'dart:convert';

import 'package:andiplex/features/movies_info/data/models/movies_reviews_model.dart';

MoviesReviewsDTO moviesReviewsDtoFromJson(String str) =>
    MoviesReviewsDTO.fromJson(json.decode(str));

String moviesReviewsDtoToJson(MoviesReviewsDTO data) =>
    json.encode(data.toJson());

class MoviesReviewsDTO {
  MoviesReviewsDTO({
    this.id,
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? id;
  final int? page;
  final List<MoviesReviewsModel>? results;
  final int? totalPages;
  final int? totalResults;

  factory MoviesReviewsDTO.fromJson(Map<String, dynamic> json) =>
      MoviesReviewsDTO(
        id: json["id"],
        page: json["page"],
        results: List<MoviesReviewsModel>.from(
            json["results"].map((x) => MoviesReviewsModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "page": page,
        "results": List<MoviesReviewsModel>.from(
            results?.map((x) => x.toJson()) ?? []),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
