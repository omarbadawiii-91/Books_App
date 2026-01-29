import 'package:books_app/data/apiservice/apicall.dart';
import 'package:books_app/data/book_model/book_model.dart';
import 'package:books_app/data/repositories/errors/errors.dart';
import 'package:books_app/data/repositories/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomerepoImplement implements HomeRepo {
  ApiCall apiCall;
  HomerepoImplement(this.apiCall);
  @override
  Future<Either<Failure, BookModel>> fetechallbooks() async {
    try {
      var dataallbooks = await apiCall.fetchBooks("filter=free-ebooks&q=all");
      BookModel bookmodel = BookModel.fromJson(dataallbooks);
      return Right(bookmodel);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, BookModel>> fetechnewsbooks() async {
    try {
      var datanewestbooks = await apiCall.fetchBooks(
        "filter=free-ebooks&Sorting=newest&q=all",
      );
      BookModel newest ;
      newest = BookModel.fromJson(datanewestbooks);
      return Right(newest);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, BookModel>> fetechrelatedbooks({String? category}) async{
    try {
      var datanewestbooks = await apiCall.fetchBooks(
        "filter=free-ebooks&Sorting=relevance&q=$category",
      );
      BookModel newest ;
      newest = BookModel.fromJson(datanewestbooks);
      return Right(newest);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
  
  @override
  Future<Either<Failure, BookModel>> fetechBooksSearch({required String query})async {
    try {
      var datanewestbooks = await apiCall.fetchBooks(
        "filter=free-ebooks&Sorting=relevance&q=$query",
      );
      BookModel newest ;
      newest = BookModel.fromJson(datanewestbooks);
      return Right(newest);
    } catch (e) {
      // ignore: deprecated_member_use
      if (e is DioError) {
        return Left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
