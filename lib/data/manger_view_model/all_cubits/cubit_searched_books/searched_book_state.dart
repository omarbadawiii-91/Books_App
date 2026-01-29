part of 'searched_book_cubit.dart';

@immutable
sealed class SearchedBookState {}

final class SearchedBookInitial extends SearchedBookState {}

final class SearchedBookLoading extends SearchedBookState {}
final class SearchedBookSuccess extends SearchedBookState {
  final BookModel bookmodel;
  SearchedBookSuccess(this.bookmodel);
}
final class SearchedBookFailure extends SearchedBookState {
  final String errormessage;
  SearchedBookFailure(this.errormessage);
}
