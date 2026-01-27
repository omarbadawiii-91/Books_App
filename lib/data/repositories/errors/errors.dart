import 'package:dio/dio.dart';

abstract class Failure{
String errmessage;
Failure(this.errmessage);
}

class ServerFailure extends Failure{
ServerFailure(super.errmessage);

// ignore: deprecated_member_use
factory ServerFailure.fromDioError(DioError dioError){
  switch(dioError.type){
 
    case DioExceptionType.connectionTimeout:
    return ServerFailure('Connection timeout with ApiServer');
    case DioExceptionType.sendTimeout:
      return ServerFailure('Send timeout with ApiServer');
    case DioExceptionType.receiveTimeout:
      return ServerFailure('Receive timeout with ApiServer');
    case DioExceptionType.badCertificate:
      return ServerFailure('BadCertificate with ApiServer');
    case DioExceptionType.badResponse:
      return ServerFailure('BadResponse with ApiServer');
    case DioExceptionType.cancel:
      return ServerFailure('Cancel with ApiServer');
    case DioExceptionType.connectionError:
      return ServerFailure.fromDioResponse(dioError.response!.statusCode, dioError.response!.data);
    case DioExceptionType.unknown:
     if(dioError.message!.contains('SocketException')){
      return ServerFailure('No internet connection');
     }
      return ServerFailure.fromDioResponse(dioError.response!.statusCode, dioError.response!.data);
}
}

factory ServerFailure.fromDioResponse(int? statusCode, dynamic response){
  if(statusCode==400 || statusCode==401 || statusCode==403){
    return ServerFailure(response['error']['message']);
  }else if(statusCode==404){
    return ServerFailure('Your request not found');
  }else if(statusCode==500){
    return ServerFailure('Internal Server error');
  }else{
    return ServerFailure("Opps something went wrong");
  }
}
}