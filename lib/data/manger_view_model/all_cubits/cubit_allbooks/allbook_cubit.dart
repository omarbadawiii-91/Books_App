import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/repositories/homerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'allbook_state.dart';

class AllbooksCubit extends Cubit<AllbookscubitState> {
  AllbooksCubit(this.homeRepo) : super(AllbookscubitStateInitial());
  static AllbooksCubit get(context) => BlocProvider.of(context);
  HomeRepo homeRepo;
  Future<void> fetchAllBooks(String endpoint) async {
    emit(AllbookscubitStateLoading());
    var result = await homeRepo.fetechallbooks();
    result.fold(
      (failure) {
        emit(AllbookscubitStateError(failure.errmessage));
      },
      (books) {
        emit(AllbookscubitStateSuccess(books));
      },
    );
  }
}
