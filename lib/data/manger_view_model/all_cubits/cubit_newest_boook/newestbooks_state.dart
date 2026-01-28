part of 'newestbooks_cubit.dart';

@immutable
sealed class NewestbooksState {}

final class NewestbooksInitial extends NewestbooksState {}

final class NewestbooksSuccess extends NewestbooksState {
  final BookModel booksmodel;
  NewestbooksSuccess(this.booksmodel);
}

final class NewestbooksError extends NewestbooksState {
  final String errormessage;
  NewestbooksError(this.errormessage);
}

final class NewestbooksLoading extends NewestbooksState {}
