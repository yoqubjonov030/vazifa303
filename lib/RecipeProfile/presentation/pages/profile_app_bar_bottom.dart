import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/bottom_tab_bar.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_view_model.dart';

import '../../../core/app_colors.dart';

class ProfileAppBarBottom extends StatelessWidget implements PreferredSize {
  const ProfileAppBarBottom({super.key});
  @override
  Size get preferredSize => Size(double.infinity, 130);

  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ProfileViewModel>();
    return //P//referredSize(
        //preferredSize: Size(356, 130),
        Column(
      spacing: 10,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 175,
              height: 27,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC6C9),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: AppColors.pinkSub),
                ),
              ),
            ),
            Container(
              width: 175,
              height: 27,
              decoration: BoxDecoration(
                  color: Color(0xFFFFC6C9),
                  borderRadius: BorderRadius.circular(12)),
              child: Center(
                child: Text(
                  "Share Profile",
                  style: TextStyle(color: AppColors.pinkSub),
                ),
              ),
            ),
          ],
        ),
        Container(
          width: 356,
          height: 50,
          decoration: BoxDecoration(
            color: AppColors.beigeColor,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: Color(0xFFFFC6C9),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "${vm.myProfile!.recipes}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Recipes",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 26,
                      color: Color(0xFFFFC6C9),
                    ),
                    Column(
                      children: [
                        Text(
                          "${vm.myProfile!.following}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Following",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                    Container(
                      width: 1,
                      height: 26,
                      color: Color(0xFFFFC6C9),
                    ),
                    Column(
                      children: [
                        Text(
                          "${vm.myProfile!.followers}",
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          "Followers",
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomTabBar(),
      ],
    );
  }

  @override
  // TODO: implement child
  Widget get child => throw UnimplementedError();
}
