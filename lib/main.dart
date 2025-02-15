import 'package:flutter/material.dart';
import 'package:uy_ishi_17/RecipeOnBoarding/data/repositories/onboarding_repository.dart';
import 'package:uy_ishi_17/RecipeOnBoarding/presentation/pages/onboarding_view.dart';
import 'package:uy_ishi_17/RecipeOnBoarding/presentation/pages/onboarding_view_model.dart';
import 'package:uy_ishi_17/categories/data/repositories/categories_repository.dart';
import 'package:uy_ishi_17/categories/presentation/pages/categories_view.dart';
import 'package:uy_ishi_17/categories/presentation/pages/categories_view_model.dart';
import 'package:uy_ishi_17/core/app_colors.dart';
import 'package:uy_ishi_17/core/client.dart';
import 'package:uy_ishi_17/core/sizes.dart';
import 'package:dio/dio.dart';
import 'package:go_router/go_router.dart';
void main() {
  runApp(ProfileApp());
}

GoRouter router = GoRouter(
  initialLocation: '/categories',
  routes: [
    GoRoute(
      path: '/onboarding',
    ),
    GoRoute(path: '/categories')
  ],
);

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          colorScheme: ColorScheme(
              brightness: Brightness.dark,
              primary: Color(0xFFFD5D69),
              onPrimary: Colors.white,
              secondary: Colors.pink,
              onSecondary: AppColors.pinkSub,
              error: Colors.red,
              onError: Colors.white,
              surface: AppColors.beigeColor,
              onSurface: Color(0xFFFD5D69))),
      home: CategoriesView(
          viewModel: CategoriesViewModel(
              repo: CategoriesRepository(client: ApiClient()))),
    );
  }
}
