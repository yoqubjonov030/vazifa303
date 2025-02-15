import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:uy_ishi_17/auth/data/repositories/auth_repository.dart';
import 'package:uy_ishi_17/auth/presentation/manager/login_view_model.dart';
import 'package:uy_ishi_17/auth/presentation/pages/login_view.dart';
import 'package:uy_ishi_17/auth/presentation/pages/auth_informations.dart';
import 'package:uy_ishi_17/core/client.dart';
import 'package:uy_ishi_17/core/sizes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    final GoRouter _router = GoRouter(
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) {
            return LoginView(
              vm: LoginViewModel(repo: AuthRepository(client: ApiClient())),
            );
          },
        ),
        GoRoute(
          path: '/auth_informations',
          builder: (context, state) {
            return const AuthInformations();
          },
        ),
      ],
    );
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
