import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/categories_details/data/repositories/categories_detail_repository.dart';
import 'package:uy_ishi_17/categories_details/presentation/pages/categories_detail_view_model.dart';
import 'package:uy_ishi_17/core/routers/router_name.dart';
import 'RecipeOnBoarding/data/repositories/onboarding_repository.dart';
import 'RecipeOnBoarding/presentation/pages/onboarding_view.dart';
import 'RecipeOnBoarding/presentation/pages/onboarding_view_model.dart';
import 'RecipeProfile/data/repositories/profile_repository.dart';
import 'RecipeProfile/presentation/pages/profile_view_model.dart';
import 'auth/data/repositories/auth_repository.dart';
import 'auth/presentation/manager/login_view_model.dart';
import 'auth/presentation/pages/auth_informations.dart';
import 'auth/presentation/pages/login_view.dart';
import 'auth/presentation/pages/complete_profile_view.dart';
import 'categories/data/models/category_model.dart';
import 'categories/data/repositories/categories_repository.dart';
import 'categories/presentation/pages/categories_view.dart';
import 'categories/presentation/pages/categories_view_model.dart';
import 'categories_details/presentation/pages/categories_detail_view.dart';
import 'core/client.dart';
import 'core/sizes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        Provider<ApiClient>(create: (_) => ApiClient()),
        Provider<AuthRepository>(
            create: (_) => AuthRepository(client: ApiClient())),
        ChangeNotifierProvider<LoginViewModel>(
            create: (context) =>
                LoginViewModel(repo: context.read<AuthRepository>())),
        Provider<OnboardingRepository>(
            create: (_) => OnboardingRepository(client: ApiClient())),
        ChangeNotifierProvider<OnboardingViewModel>(
            create: (context) => OnboardingViewModel(
                repo: context.read<OnboardingRepository>())),
        Provider<CategoriesRepository>(
            create: (_) => CategoriesRepository(client: ApiClient())),
        ChangeNotifierProvider<CategoriesViewModel>(
            create: (context) => CategoriesViewModel(
                repo: context.read<CategoriesRepository>())),
        ChangeNotifierProvider<ProfileViewModel>(
          create: (context) => ProfileViewModel(
            repo: ProfileRepository(client: ApiClient()),
          ),
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    AppSizes.init(context);
    final GoRouter _router = GoRouter(
      initialLocation: Routes.categories,
      routes: [
        GoRoute(
          path: Routes.login,
          builder: (context, state) {
            return LoginView(
              vm: context.read<LoginViewModel>(),
            );
          },
        ),
        GoRoute(
          path: Routes.authInformations,
          builder: (context, state) {
            return AuthInformations();
          },
        ),
        GoRoute(
          path: Routes.categories,
          builder: (context, state) {
            return CategoriesView(
                viewModel: context.read<CategoriesViewModel>());
          },
        ),
        GoRoute(
          path: Routes.onboarding,
          builder: (context, state) {
            return OnboardingView(ovm: context.read<OnboardingViewModel>());
          },
        ),
        GoRoute(
          path: '/profile_photo_picker',
          builder: (context, state) {
            return ProfilePhotoPicker();
          },
        ),
        GoRoute(
          path: Routes.categoryDetail,
          builder: (context, state) {
            return CategoriesDetailView(
              viewModel: CategoriesDetailViewModel(
                repo: CategoriesDetailRepository(client: ApiClient()),
                catsRepo: context.read(),
                selected: state.extra as CategoryModel,
              ),
            );
          },
        )
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
