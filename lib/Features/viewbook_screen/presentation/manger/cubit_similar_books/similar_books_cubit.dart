import 'package:bloc/bloc.dart';
import 'package:books_app/Features/homepage_screen/data/book_model/book_model.dart';
import 'package:books_app/Features/homepage_screen/domain/repository/homerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());
  static SimilarBooksCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  BookModel? bookmodel;
  Future<void> fetchSimilarBooks(String category) async {
    emit(SimilarBooksLoading());
    var result = await homeRepo.fetechrelatedbooks(category: category);
    result.fold(
      (failure) {
        emit(SimilarBooksError(failure.errmessage));
      },
      (books) {
        emit(SimilarBooksSuccess(books));
      },
    );
  }
}
