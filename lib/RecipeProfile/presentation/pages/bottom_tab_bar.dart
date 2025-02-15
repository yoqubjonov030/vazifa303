import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/sizes.dart';

class bottomTabBar extends StatelessWidget {
  const bottomTabBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: AppColors.pinkSub,
        tabs: [
          Text(
            "Recipes",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12 * AppSizes.wRatio,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text(
            "Favourites",
            style: TextStyle(
              color: Colors.white,
              fontSize: 12 * AppSizes.wRatio,
              fontWeight: FontWeight.w400,
            ),
          )
        ]);
  }
}
