import 'package:books_app/dio/Repository/repo_failure.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:books_app/dio/Repository/repo_fetch_data.dart';
import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:meta/meta.dart';

part 'allbook_state.dart';

class AllbooksCubit extends Cubit<MangerdataState> {
  AllbooksCubit(this.repoFetchData) : super(MangerdataInitial());
  static AllbooksCubit get(context) => BlocProvider.of(context);
  final RepoFetchData repoFetchData;
  

  Future<void> fetchdata() async {
    emit(MangerdataLoading());
    var result = await RepoFetchData().getfetechdata("filter=free-ebooks&q=all");
    result.fold((Failure failure) {
      emit(MangerdataError(failure.errormessage));
    }, (books) {
      emit(MangerdataSuccess(books));
    });
  }
}