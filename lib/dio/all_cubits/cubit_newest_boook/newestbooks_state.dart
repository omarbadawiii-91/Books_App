part of 'newestbooks_cubit.dart';

@immutable
sealed class NewestbooksState {}

final class NewestbooksInitial extends NewestbooksState {}
final class NewestbooksSuccess extends NewestbooksState {
  final List<BooksModel> books;
  NewestbooksSuccess(this.books);
}
final class NewestbooksError extends NewestbooksState {
  final String errormessage;
  NewestbooksError(this.errormessage);
}
final class NewestbooksLoading extends NewestbooksState {}

