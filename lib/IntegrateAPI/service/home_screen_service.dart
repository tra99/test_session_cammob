import 'dart:convert';
import 'package:http/http.dart' as http;
import '../exceptions/custom_exception.dart';
import '../model/exception.dart';
import '../model/home_model.dart';

class RemoteApiHomeData {
  static Future<List<dynamic>> fetchPosts(int page) async {
    final url = 'https://jsonplaceholder.typicode.com/comments?_page=$page&_limit=10';
    print("$url");
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
      return jsonList;
    } else {
      throw Exception('Failed to load posts');
    }
  }
  // static Future<List<HomeModel>> fetchHomeData(int pageKey, int pageSize) async {
  //   try {
  //     final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/comments?_page=$pageKey&_limit=$pageSize'));
  //     print('API Call: https://jsonplaceholder.typicode.com/comments?_page=$pageKey&_limit=$pageSize');
  //     print('Response Status: ${response.statusCode}');
      
  //     if (response.statusCode == 200) {
  //       final List<dynamic> jsonList = jsonDecode(response.body) as List<dynamic>;
  //       print('Response Data: $jsonList');
  //       return jsonList.map((json) => HomeModel.fromJson(json as Map<String, dynamic>)).toList();
  //     } else if (response.statusCode == 400) {
  //       throw CustomException(ExceptionType.badRequest);
  //     } else if (response.statusCode == 401) {
  //       throw CustomException(ExceptionType.unauthorisedRequest);
  //     } else if (response.statusCode == 404) {
  //       throw CustomException(ExceptionType.notFound);
  //     } else if (response.statusCode == 500) {
  //       throw CustomException(ExceptionType.internalServerError);
  //     } else if (response.statusCode == 503) {
  //       throw CustomException(ExceptionType.serviceUnavailable);
  //     } else {
  //       throw CustomException(ExceptionType.unknownError);
  //     }
  //   } on CustomException catch (e) {
  //     print('CustomException: ${e.errorMessage()}');
  //     rethrow; // Rethrow the CustomException
  //   } on Exception catch (e) {
  //     print('Exception: $e');
  //     throw CustomException(ExceptionType.unknownError);
  //   }
  // }
}
