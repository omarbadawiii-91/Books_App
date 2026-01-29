import 'package:bloc/bloc.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/repositories/homerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'searched_book_state.dart';

class SearchedBookCubit extends Cubit<SearchedBookState> {
  SearchedBookCubit(this.homeRepo) : super(SearchedBookInitial());
  static SearchedBookCubit get(context) => BlocProvider.of(context);

  HomeRepo homeRepo;
  BookModel? bookmodel;
  Future<void> fetchSearchedBooks(String query) async {
    emit(SearchedBookLoading());
    var result = await homeRepo.fetechBooksSearch(query: query);
    result.fold(
      (failure) {
        emit(SearchedBookFailure(failure.errmessage));
      },
      (books) {
        emit(SearchedBookSuccess(books));
        bookmodel = books;
      },
    );
  }
}
