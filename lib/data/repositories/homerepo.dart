import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/data/repositories/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
 Future<Either<Failure, List<BooksModel>>> fetechallbooks();
  Future<Either<Failure, List<BooksModel>>>fetechnewsbooks();
}