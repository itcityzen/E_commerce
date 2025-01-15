import 'package:dio/dio.dart';

abstract class ApiConsumer {
  Future<dynamic> get(String Url, {Map<String, dynamic>? QueryParameters});
  Future<dynamic> post(String Url,
      {Map<String, dynamic>? Body, Options? options});

  Future<dynamic> put(String Url,
      {Map<String, dynamic>? Body, Options? options});

  Future<dynamic> delete(String Url, {Options? options});
}
