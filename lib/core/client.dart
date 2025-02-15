import 'dart:io';

import 'package:dio/dio.dart';
import 'package:uy_ishi_17/core/exceptions/auth_exception.dart';

import '../auth/data/models/user_model.dart';

class ApiClient {
  Dio dio = Dio(BaseOptions(
      baseUrl: "http://192.168.0.100:8888/api/v1",
      validateStatus: (status) => true));

  Future<dynamic> fetchMyProfile() async {
    var response = await dio.get('/auth/details/1');
    return response.data;
  }

  Future<dynamic> fetchProfileRecipe() async {
    var response = await dio.get('/recipes/detail/2');
    dynamic data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchOnboardingPages() async {
    var response = await dio.get("/onboarding/list");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw Exception("not found");
    }
  }

  Future<List<dynamic>> fetchCategories(int categoryId) async {
    var response = await dio.get('/categories/list');
    List<dynamic> data = response.data;
    return data;
  }

  Future<String> login(String login, String password) async {
    var response = await dio.post(
      '/auth/login',
      data: {"login": login, "password": password},
    );

    if (response.statusCode == 200) {
      Map<String, String> data = Map<String, String>.from(response.data);
      return data['accessToken']!;
    } else {
      throw AuthException(
          message: "Login amalga oshirilmadi xullas nmadir xato ketti!");
    }
  }

  Future<bool> signUp(UserModel model) async {
    var response = await dio.post("/auth/register", data: model.toJson());
    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> uploadProfilePhoto(File file) async {
    FormData formData = FormData.fromMap(
      {
        "profilePhoto": await MultipartFile.fromFile(
          file.path,
          filename: file.path
              .split('/')
              .last,
        )
      },
    );

    var response = await dio.patch(
      'auth/upload',
      data: formData,
      options: Options(
        headers: {"Content-Type": "multipart/form-data"},
      ),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<dynamic> fetchCategoryDetails() async {
    var response = await dio.get('recipes/detail/2');
    dynamic data = response.data;
    return data;
  }

  Future<List<dynamic>> fetchRecipesByCategoryId(int categoryId) async {
    var response = await dio.get("/recipes/list?Category=$categoryId");
    final List<dynamic> data = response.data;
    return data;
  }

  Future<dynamic> fetchRecipeById(int recipeId) async {
    var response = await dio.get('/recipes/detail/$recipeId');
    dynamic data = response.data;
    return data;
  }
}
