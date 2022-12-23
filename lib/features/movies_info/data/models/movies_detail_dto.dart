// To parse this JSON data, do
//
//     final moviesDetailModel = moviesDetailModelFromJson(jsonString);

import 'dart:convert';

import 'package:andiplex/features/movies_info/data/models/genre_model.dart';
import 'package:andiplex/features/movies_info/data/models/production_companies_model.dart';
import 'package:andiplex/features/movies_info/data/models/production_countries_model.dart';
import 'package:andiplex/features/movies_info/data/models/spoken_languages_model.dart';

MoviesDetailDTO moviesDetailDtoFromJson(String str) =>
    MoviesDetailDTO.fromJson(json.decode(str));

String moviesDetailDtoToJson(MoviesDetailDTO data) =>
    json.encode(data.toJson());

class MoviesDetailDTO {
  MoviesDetailDTO({
    this.adult,
    this.backdropPath,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  final bool? adult;
  final String? backdropPath;
  final int? budget;
  final List<GenreModel>? genres;
  final String? homepage;
  final int? id;
  final String? imdbId;
  final String? originalLanguage;
  final String? originalTitle;
  final String? overview;
  final double? popularity;
  final String? posterPath;
  final List<ProductionCompaniesModel>? productionCompanies;
  final List<ProductionCountriesModel>? productionCountries;
  final DateTime? releaseDate;
  final int? revenue;
  final int? runtime;
  final List<SpokenLanguagesModel>? spokenLanguages;
  final String? status;
  final String? tagline;
  final String? title;
  final bool? video;
  final double? voteAverage;
  final int? voteCount;

  factory MoviesDetailDTO.fromJson(Map<String, dynamic> json) =>
      MoviesDetailDTO(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        budget: json["budget"],
        genres: List<GenreModel>.from(
            json["genres"].map((x) => GenreModel.fromJson(x))),
        homepage: json["homepage"],
        id: json["id"],
        imdbId: json["imdb_id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"].toDouble(),
        posterPath: json["poster_path"],
        productionCompanies: List<ProductionCompaniesModel>.from(
            json["production_companies"]
                .map((x) => ProductionCompaniesModel.fromJson(x))),
        productionCountries: List<ProductionCountriesModel>.from(
            json["production_countries"]
                .map((x) => ProductionCountriesModel.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguagesModel>.from(
            json["spoken_languages"]
                .map((x) => SpokenLanguagesModel.fromJson(x))),
        status: json["status"],
        tagline: json["tagline"],
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"].toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "budget": budget,
        "genres": List<dynamic>.from(genres?.map((x) => x.toJson()) ?? []),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(
            productionCompanies?.map((x) => x.toJson()) ?? []),
        "production_countries": List<dynamic>.from(
            productionCountries?.map((x) => x.toJson()) ?? []),
        "release_date":
            "${releaseDate?.year.toString().padLeft(4, '0')}-${releaseDate?.month.toString().padLeft(2, '0')}-${releaseDate?.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages":
            List<dynamic>.from(spokenLanguages?.map((x) => x.toJson()) ?? []),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
