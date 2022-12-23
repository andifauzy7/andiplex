// To parse this JSON data, do
//
//     final moviesNowPlayingDto = moviesNowPlayingDtoFromJson(jsonString);

import 'dart:convert';

import 'package:andiplex/features/movies_info/data/models/movies_info_model.dart';

MoviesPopularDTO moviesPopularDtoFromJson(String str) =>
    MoviesPopularDTO.fromJson(json.decode(str));

String moviesPopularDtoToJson(MoviesPopularDTO data) =>
    json.encode(data.toJson());

class MoviesPopularDTO {
  MoviesPopularDTO({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  final int? page;
  final List<MoviesInfoModel>? results;
  final int? totalPages;
  final int? totalResults;

  factory MoviesPopularDTO.fromJson(Map<String, dynamic> json) =>
      MoviesPopularDTO(
        page: json["page"],
        results: List<MoviesInfoModel>.from(
            json["results"].map((x) => MoviesInfoModel.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results?.map((x) => x.toJson()) ?? []),
        "total_pages": totalPages,
        "total_results": totalResults,
      };
}
