import 'package:books_app/Features/homepage_screen/data/book_model/book_model.dart';
import 'package:books_app/core/errors/failure.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetechallbooks();
  Future<Either<Failure, BookModel>> fetechnewsbooks();
    Future<Either<Failure, BookModel>> fetechrelatedbooks({required String category});
  Future<Either<Failure, BookModel>> fetechBooksSearch({required String query});


}
