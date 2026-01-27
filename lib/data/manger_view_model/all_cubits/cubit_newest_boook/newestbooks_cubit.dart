import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/data/repositories/homerepo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'newestbooks_state.dart';

class NewestbooksCubit extends Cubit<NewestbooksState> {
  NewestbooksCubit(this.homeRepo) : super(NewestbooksInitial());
  static NewestbooksCubit get(context) => BlocProvider.of(context);
HomeRepo homeRepo;
Future<void> fetchNewestBooks(String endpoint) async {
  emit(NewestbooksLoading());
 var result = await homeRepo.fetechnewsbooks();
result.fold((failure){
  emit(NewestbooksError(failure.errmessage));
},(books){
  emit(NewestbooksSuccess(books));
} );
}

  

}
