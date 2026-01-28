import 'package:dio/dio.dart';

class ApiCall {
  String baseUrl = "https://www.googleapis.com/books/v1/volumes?";
  final Dio dio;
  ApiCall(this.dio);
  Future<Map<String, dynamic>> fetchBooks(String endpoint) async {
    var response = await dio.get('$baseUrl$endpoint');
    return response.data;
  }
}
