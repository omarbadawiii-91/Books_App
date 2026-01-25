import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/dio/Repository/repo_failure.dart';
import 'package:books_app/dio/Repository/repo_fetch_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.repoFetchData) : super(NewestbooksInitial());
  static NewestbooksCubit get(context) => BlocProvider.of(context);
  final RepoFetchData repoFetchData ;

  Future<void> fetchdata() async {
    emit(NewestbooksLoading());
    var result = await repoFetchData.getfetechdata("filter=free-ebooks&Sorting=newest&q=all");
    result.fold((Failure failure) {
      emit(NewestbooksError(failure.errormessage));
    }, (books) {
      emit(NewestbooksSuccess(books));
    });
  }
  

}
