import 'package:flutter/material.dart';
import 'package:uy_ishi_17/auth/data/repositories/auth_repository.dart';

class LoginViewModel extends ChangeNotifier {
  LoginViewModel({required AuthRepository repo}) : _repo = repo;

  final AuthRepository _repo;

  String? _errorMassage;
  bool get hasError => _errorMassage != null;
  String? get errorMassage => _errorMassage;

  final formKey = GlobalKey<FormState>();
  final loginController = TextEditingController();

  final passwordController = TextEditingController();

  Future<bool> login() async {
    try {
      await _repo.login(
        loginController.text,
        passwordController.text,
      );
    }on Exception catch(e){
      _errorMassage = e.toString();
      notifyListeners();
      return false;
    }
    _errorMassage = null;
      notifyListeners();
      return true;
  }
}
