import 'package:andiplex/features/movies_info/data/models/author_details_model.dart';

class MoviesReviewsModel {
  MoviesReviewsModel({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  final String? author;
  final AuthorDetailsModel? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  factory MoviesReviewsModel.fromJson(Map<String, dynamic> json) =>
      MoviesReviewsModel(
        author: json["author"],
        authorDetails: AuthorDetailsModel.fromJson(json["author_details"]),
        content: json["content"],
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
        updatedAt: DateTime.parse(json["updated_at"]),
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "author": author,
        "author_details": authorDetails?.toJson(),
        "content": content,
        "created_at": createdAt?.toIso8601String(),
        "id": id,
        "updated_at": updatedAt?.toIso8601String(),
        "url": url,
      };
}
