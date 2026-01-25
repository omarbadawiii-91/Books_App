import 'package:dio/dio.dart';

abstract class Failure{
  final String errormessage;

  const Failure(this.errormessage);

}

class ServerFailure extends Failure{
  const ServerFailure(super.errormessage);
  factory ServerFailure.fromDioError(DioException dioError){
   switch(dioError.type){
     case DioExceptionType.connectionTimeout:
     return const ServerFailure('Connection timeout with API server');
     case DioExceptionType.sendTimeout:
       return const ServerFailure('Send timeout with API server');
     case DioExceptionType.receiveTimeout:
       return const ServerFailure('Receive timeout with API server');
     case DioExceptionType.badCertificate:
       return const ServerFailure('Bad certificate with API server');
     case DioExceptionType.badResponse:
       return ServerFailure.fromResponse(dioError.response!.statusCode!,dioError.response!.data);
     case DioExceptionType.cancel:
       return const ServerFailure('Request to API server was canceled');
     case DioExceptionType.connectionError:
       return const ServerFailure('No internet connection');
     case DioExceptionType.unknown:
       if(dioError.message!.contains('SocketException')){
         return const ServerFailure('No internet connection');
       }else{
         return const ServerFailure('Opps something went wrong');
       }
   }
  }

  factory ServerFailure.fromResponse(int? statuscode,String message){
    if(statuscode==400 || statuscode==401 || statuscode==403){
      return ServerFailure(message);
    }else if(statuscode==404){
      return ServerFailure("Your request not found , please try again");
    }else if(statuscode==500){
      return ServerFailure("Internal server error , please try again");
    }else{
      return ServerFailure("Opps something went wrong , please try again");
    }
  }
}

