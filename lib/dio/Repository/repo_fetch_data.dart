import 'package:books_app/data/apiservice/apicall.dart';
import 'package:books_app/data/data_model/books_model/books_model.dart';
import 'package:books_app/dio/Repository/repo_failure.dart';
import 'package:dio/dio.dart';
import 'package:dartz/dartz.dart';

class RepoFetchData {
  ApiCall? apiCall ;
RepoFetchData({this.apiCall});
  Future<Either<Failure,List<BooksModel>>> getfetechdata(String endpoint)async{
 var response = await apiCall!.fetchBooks(endpoint);
 List<BooksModel> booksModel = [];
try{
   for(var item in response['items']){
   booksModel.add(BooksModel.fromJson(item));
 }
 return  right(booksModel);
}catch(e){
  if(e is DioException){
    return left(ServerFailure.fromDioError(e));
  }
  else{
    return left( ServerFailure(e.toString()));
  }
}
  }
  }
