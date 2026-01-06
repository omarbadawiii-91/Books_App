import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/data/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class RepoFetchData {
  Future<Either<Failure, BooksModel>> bestsellerBooksFetechdata();
  Future<Either<Failure, BooksModel>> featuredBooksFetechdata();
}
