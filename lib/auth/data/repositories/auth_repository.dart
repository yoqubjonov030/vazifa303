import 'dart:io';

import 'package:uy_ishi_17/auth/data/models/user_model.dart';
import 'package:uy_ishi_17/core/secure_storage.dart';

import '../../../core/client.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<void> login(String login, String password) async {
    final String token = await client.login(login, password);
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
    await SecureStorage.saveCredentials(login: login, password: password);
    await SecureStorage.saveToken(token);
  }

  Future<bool> uploadProfilePhoto(File file) async{
    final result = await client.uploadProfilePhoto(file);
    return result;
  }

  Future<bool> signUp(
      {required String firstName,
      required String lastName,
      required String username,
      required String email,
      required DateTime dateOfBirth,
      required String password,
      required String phoneNumber}) async {
    final result = await client.signUp(
      UserModel(
        firstName: firstName,
        lastName: lastName,
        username: username,
        email: email,
        phoneNumber: phoneNumber,
        password: password,
        dateOfBirth: dateOfBirth,
      ),
    );
    return result;
  }


}
