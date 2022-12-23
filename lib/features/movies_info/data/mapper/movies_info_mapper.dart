import 'package:andiplex/features/movies_info/data/models/author_details_model.dart';
import 'package:andiplex/features/movies_info/data/models/genre_model.dart';
import 'package:andiplex/features/movies_info/data/models/movies_detail_dto.dart';
import 'package:andiplex/features/movies_info/data/models/movies_info_model.dart';
import 'package:andiplex/features/movies_info/data/models/movies_reviews_model.dart';
import 'package:andiplex/features/movies_info/data/models/production_companies_model.dart';
import 'package:andiplex/features/movies_info/data/models/production_countries_model.dart';
import 'package:andiplex/features/movies_info/data/models/spoken_languages_model.dart';
import 'package:andiplex/features/movies_info/domain/entities/author_details.dart';
import 'package:andiplex/features/movies_info/domain/entities/genre.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_detail.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_info.dart';
import 'package:andiplex/features/movies_info/domain/entities/movies_reviews.dart';
import 'package:andiplex/features/movies_info/domain/entities/production_companies.dart';
import 'package:andiplex/features/movies_info/domain/entities/production_countries.dart';
import 'package:andiplex/features/movies_info/domain/entities/spoken_languages.dart';

class MoviesInfoMapper {
  static MoviesInfo moviesInfoModelToMoviesInfo(
          MoviesInfoModel moviesInfoModel) =>
      MoviesInfo(
        posterPath: moviesInfoModel.posterPath,
        adult: moviesInfoModel.adult,
        overview: moviesInfoModel.overview,
        releaseDate: moviesInfoModel.releaseDate,
        genreIds: moviesInfoModel.genreIds,
        id: moviesInfoModel.id,
        originalTitle: moviesInfoModel.originalTitle,
        originalLanguage: moviesInfoModel.originalLanguage,
        title: moviesInfoModel.title,
        backdropPath: moviesInfoModel.backdropPath,
        popularity: moviesInfoModel.popularity,
        voteCount: moviesInfoModel.voteCount,
        video: moviesInfoModel.video,
        voteAverage: moviesInfoModel.voteAverage,
      );

  static MoviesDetail moviesDetailDtoToMoviesDetail(
          MoviesDetailDTO moviesDetailDTO) =>
      MoviesDetail(
        adult: moviesDetailDTO.adult,
        backdropPath: moviesDetailDTO.backdropPath,
        budget: moviesDetailDTO.budget,
        genres: List<Genre>.from(
          moviesDetailDTO.genres?.map(
                (x) => MoviesInfoMapper.genreModelToGenre(x),
              ) ??
              [],
        ),
        homepage: moviesDetailDTO.homepage,
        id: moviesDetailDTO.id,
        imdbId: moviesDetailDTO.imdbId,
        originalLanguage: moviesDetailDTO.originalLanguage,
        originalTitle: moviesDetailDTO.originalTitle,
        overview: moviesDetailDTO.overview,
        popularity: moviesDetailDTO.popularity,
        posterPath: moviesDetailDTO.posterPath,
        productionCompanies: List<ProductionCompanies>.from(
          moviesDetailDTO.productionCompanies?.map(
                (x) => MoviesInfoMapper
                    .productionCompaniesModelToProductionCompanies(x),
              ) ??
              [],
        ),
        productionCountries: List<ProductionCountries>.from(
          moviesDetailDTO.productionCountries?.map(
                (x) => MoviesInfoMapper
                    .productionCountriesModelToProductionCountries(x),
              ) ??
              [],
        ),
        releaseDate: moviesDetailDTO.releaseDate,
        revenue: moviesDetailDTO.revenue,
        runtime: moviesDetailDTO.runtime,
        spokenLanguages: List<SpokenLanguages>.from(
          moviesDetailDTO.spokenLanguages?.map(
                (x) =>
                    MoviesInfoMapper.spokenLanguagesModelToSpokenLanguages(x),
              ) ??
              [],
        ),
        status: moviesDetailDTO.status,
        tagline: moviesDetailDTO.tagline,
        title: moviesDetailDTO.title,
        video: moviesDetailDTO.video,
        voteAverage: moviesDetailDTO.voteAverage,
        voteCount: moviesDetailDTO.voteCount,
      );

  static Genre genreModelToGenre(GenreModel genreModel) => Genre(
        id: genreModel.id,
        name: genreModel.name,
      );

  static ProductionCompanies productionCompaniesModelToProductionCompanies(
          ProductionCompaniesModel productionCompaniesModel) =>
      ProductionCompanies(
        id: productionCompaniesModel.id,
        logoPath: productionCompaniesModel.logoPath,
        name: productionCompaniesModel.name,
        originCountry: productionCompaniesModel.originCountry,
      );

  static ProductionCountries productionCountriesModelToProductionCountries(
          ProductionCountriesModel productionCountriesModel) =>
      ProductionCountries(
        iso31661: productionCountriesModel.iso31661,
        name: productionCountriesModel.name,
      );

  static SpokenLanguages spokenLanguagesModelToSpokenLanguages(
          SpokenLanguagesModel spokenLanguagesModel) =>
      SpokenLanguages(
        iso6391: spokenLanguagesModel.iso6391,
        name: spokenLanguagesModel.name,
      );

  static MoviesReviews moviesReviewsModelToMoviesReviews(
          MoviesReviewsModel moviesReviewsModel) =>
      MoviesReviews(
        author: moviesReviewsModel.author,
        content: moviesReviewsModel.content,
        createdAt: moviesReviewsModel.createdAt,
        id: moviesReviewsModel.id,
        updatedAt: moviesReviewsModel.updatedAt,
        url: moviesReviewsModel.url,
        authorDetails:
            authorDetailsModelToAuthorDetails(moviesReviewsModel.authorDetails),
      );

  static AuthorDetails authorDetailsModelToAuthorDetails(
          AuthorDetailsModel? authorDetailsModel) =>
      AuthorDetails(
        name: authorDetailsModel?.name,
        username: authorDetailsModel?.username,
        avatarPath: authorDetailsModel?.avatarPath,
        rating: authorDetailsModel?.rating,
      );
}
