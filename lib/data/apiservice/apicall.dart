
import 'package:dio/dio.dart';

class ApiCall {
  String baseUrl = "https://www.googleapis.com/books/v1/volumes?";
  final Dio dio;
  ApiCall(this.dio);
  Future<Map<String, dynamic>> fetchBestsellerBooks() async {
   var response = await dio.get(
    '${baseUrl}q=bestseller&maxResults=10',
   );
   return response.data;
  }
}

