import 'package:dio/dio.dart';
import 'dio.dart';

class StoreRepository {
  final Dio _dio = DioClient().client;

  Future<Response> getProducts() async {
    try {
      final response = await _dio.get('products');
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getCategories() async {
    try {
      final response = await _dio.get("/categories");
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> registerUser(
      String name, String email, String password) async {
    try {
      final response = await _dio.post("/user/create/", data: {
        "name": name,
        "email": email,
        "password": password,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> loginUser(String email, String password) async {
    try {
      final response = await _dio.post("/user/login/", data: {
        "email": email,
        "password": password,
      });
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> editPassword(int userId, String password) async {
    try {
      final response = await _dio
          .put("/user/edit/", data: {"id": userId, "password": password});
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> getUser(String email) async {
    try {
      final response =
          await _dio.get("/user/get/", queryParameters: {"email": email});
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
