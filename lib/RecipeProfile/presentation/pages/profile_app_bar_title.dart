import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_view_model.dart';

import '../../../core/app_colors.dart';

class ProfileAppBarTitle extends StatelessWidget {
  const ProfileAppBarTitle({
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    var vm = context.watch<ProfileViewModel>();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          vm.myProfile!.fullName,
          style: TextStyle(
            color: AppColors.pinkSub,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          "@${vm.myProfile!.username}",
          style: TextStyle(
            color: Color(0xFFEC888D),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
        Text(
          vm.myProfile!.bio,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w300,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}
