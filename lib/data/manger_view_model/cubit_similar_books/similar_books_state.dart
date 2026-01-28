part of 'similar_books_cubit.dart';

@immutable
sealed class SimilarBooksState {}

final class SimilarBooksInitial extends SimilarBooksState {}
final class SimilarBooksSuccess extends SimilarBooksState {
  final BookModel books;
  SimilarBooksSuccess(this.books);
}
final class SimilarBooksError extends SimilarBooksState {
  final String message;
  SimilarBooksError(this.message);
}
final class SimilarBooksLoading extends SimilarBooksState {}

