 import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/data/errors/errors.dart';
import 'package:books_app/data/repo_fetech_data/repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements RepoFetchData {
  @override
  Future<Either<Failure, BooksModel>> bestsellerBooksFetechdata() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, BooksModel>> featuredBooksFetechdata() {
    throw UnimplementedError();
  }
 }