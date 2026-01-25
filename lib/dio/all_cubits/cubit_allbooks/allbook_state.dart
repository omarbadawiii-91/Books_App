part of 'allbook_cubit.dart';

@immutable
sealed class MangerdataState {}

final class MangerdataInitial extends MangerdataState {}
final class MangerdataError extends MangerdataState {
  MangerdataError(errMessage);
}
final class MangerdataLoading extends MangerdataState {}
final class MangerdataSuccess extends MangerdataState {
  MangerdataSuccess(List<BooksModel> books);
}
