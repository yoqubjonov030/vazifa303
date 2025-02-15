import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_page_body_detail.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_recipes_view_model.dart';

class ProfilePageBody extends StatelessWidget {
  const ProfilePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    var rmv = context.watch<ProfileRecipeViewModel>();
    return TabBarView(children: [
      GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          //crossAxisSpacing: 20.0, // Horizontal spacing
          mainAxisSpacing: 30.0, // Vertical spacing
        ),
        scrollDirection: Axis.vertical,
        children: [
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
          ProfilePageBodyDetail(rmv: rmv),
        ],
      ),
    ]);
  }
}
