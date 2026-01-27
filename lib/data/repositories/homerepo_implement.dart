import 'package:books_app/data/apiservice/apicall.dart';
import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/data/repositories/errors/errors.dart';
import 'package:books_app/data/repositories/homerepo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class HomerepoImplement implements HomeRepo {
  ApiCall apiCall ;
  HomerepoImplement(this.apiCall);
  @override
  Future<Either<Failure, List<BooksModel>>> fetechallbooks() async {
  try {
     var dataallbooks= await apiCall.fetchBooks("filter=free-ebooks&q=all");
     List <BooksModel> allbooks=[];
     for(var items in dataallbooks['items']){
       allbooks.add(BooksModel.fromJson(items));
     }
     return Right(allbooks);
  }
  catch(e){
    // ignore: deprecated_member_use
    if(e is DioError){
      return Left(ServerFailure.fromDioError(e));
    }
    return left (ServerFailure(e.toString()));
  }
  
  }

  @override
  Future<Either<Failure, List<BooksModel>>> fetechnewsbooks() async{
try {
     var datanewestbooks= await apiCall.fetchBooks("filter=free-ebooks&Sorting=newest&q=all");
     List <BooksModel> newest=[];
     for(var items in datanewestbooks['items']){
       newest.add(BooksModel.fromJson(items));
     }
     return Right(newest);
  }
  catch(e){
    // ignore: deprecated_member_use
    if(e is DioError){
      return Left(ServerFailure.fromDioError(e));
    }
    return left (ServerFailure(e.toString()));
  }

  }

}