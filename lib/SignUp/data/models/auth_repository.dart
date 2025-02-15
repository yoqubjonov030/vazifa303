import '../../../core/client.dart';
import '../../../core/secure_storage.dart';

class AuthRepository {
  AuthRepository({required this.client});

  final ApiClient client;

  Future<bool> login(String login, String password) async {
    var token = await client.login(login, password);
    await SecureStorage.deleteCredentials();
    await SecureStorage.deleteToken();
    await SecureStorage.saveCredentials(login, password);
    await SecureStorage.saveToken(token);
    return true;
  }

  Future<void> logout() async {
    await SecureStorage.deleteToken();
    await SecureStorage.deleteCredentials();
  }
}
