import 'package:andiplex/features/movies_info/domain/entities/author_details.dart';
import 'package:equatable/equatable.dart';

class MoviesReviews extends Equatable {
  final String? author;
  final AuthorDetails? authorDetails;
  final String? content;
  final DateTime? createdAt;
  final String? id;
  final DateTime? updatedAt;
  final String? url;

  const MoviesReviews({
    this.author,
    this.authorDetails,
    this.content,
    this.createdAt,
    this.id,
    this.updatedAt,
    this.url,
  });

  @override
  List<Object?> get props => [
        author,
        authorDetails,
        content,
        createdAt,
        id,
        updatedAt,
        url,
      ];
}
