part of 'allbook_cubit.dart';

@immutable
sealed class AllbookscubitState {}

final class AllbookscubitStateInitial extends AllbookscubitState {}
final class AllbookscubitStateError extends AllbookscubitState {
  final String errormessage;
  AllbookscubitStateError(this.errormessage);
}
final class AllbookscubitStateLoading extends AllbookscubitState {}
final class AllbookscubitStateSuccess extends AllbookscubitState {
  final List<BooksModel> viewbooks;
  AllbookscubitStateSuccess(this.viewbooks);
}
