import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/RecipeProfile/data/repositories/profile_recipe_repository.dart';
import 'package:uy_ishi_17/RecipeProfile/data/repositories/profile_repository.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/widgets/profile_app_bar_bottom.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/widgets/profile_app_bar_title.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_page_body.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_recipes_view_model.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_tab_bar_row.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_view_model.dart';
import 'package:uy_ishi_17/core/client.dart';
import '../../../core/app_colors.dart';
import '../../../core/sizes.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProfileViewModel>(
          create: (context) => ProfileViewModel(
            repo: ProfileRepository(
              client: ApiClient(),
            ),
          ),
        ),
        ChangeNotifierProvider<ProfileRecipeViewModel>(
          create: (context) => ProfileRecipeViewModel(
              repo: ProfileRecipeRepository(client: ApiClient())),
        ),
      ],
      child: ProfilePageContent(),
    );
  }
}

class ProfilePageContent extends StatelessWidget {
  const ProfilePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ProfileViewModel>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: AppColors.beigeColor,
        appBar: AppBar(
          backgroundColor: AppColors.beigeColor,
          leadingWidth: 102 * AppSizes.wRatio,
          toolbarHeight: 102 * AppSizes.hRatio,
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(51),
            child: Image.network(
              vm.myProfile!.image,
            ),
          ),
          title: ProfileAppBarTitle(),
          actions: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: ProfileTabBarRow(),
              ),
            ),
          ],
          bottom: ProfileAppBarBottom(),
        ),
        body: ProfilePageBody(),
      ),
    );
  }
}
