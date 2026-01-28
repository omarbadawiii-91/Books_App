import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/repositories/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  Future<Either<Failure, BookModel>> fetechallbooks();
  Future<Either<Failure, BookModel>> fetechnewsbooks();
    Future<Either<Failure, BookModel>> fetechrelatedbooks({required String category});

}
