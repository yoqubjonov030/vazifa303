import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uy_ishi_17/RecipeProfile/presentation/pages/profile_recipes_view_model.dart';
import 'package:uy_ishi_17/core/app_colors.dart';

class ProfilePageBodyDetail extends StatelessWidget {
  const ProfilePageBodyDetail({
    super.key,
    required this.rmv,
  });

  final ProfileRecipeViewModel rmv;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            bottom: -70,
            left: 5,
            right: 5,
            child: Container(
              width: 160,
              height: 76,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(color: AppColors.pinkSub),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      rmv.recipe!.title,
                      style: TextStyle(
                          color: Color(
                            0xFF3E2823,
                          ),
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "apida bunday qism yoq",
                      style: TextStyle(
                        color: Color(0xff3E2823),
                        fontSize: 13,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${rmv.recipe!.rating}",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                            SvgPicture.asset("assets/svg/star.svg")
                          ],
                        ),
                        Row(
                          children: [
                            SvgPicture.asset("assets/svg/clock.svg"),
                            Text(
                              "${rmv.recipe!.timeRequired}",
                              style: TextStyle(
                                color: AppColors.pinkSub,
                                fontWeight: FontWeight.w400,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(14),
            child: Image.network(
              rmv.recipe!.image,
              width: 170,
              height: 153,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: 20,
            top: 20,
            child: Container(
              width: 28,
              height: 28,
              decoration: BoxDecoration(
                color: AppColors.pinkSub,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Center(child: SvgPicture.asset("assets/svg/heart.svg")),
            ),
          )
        ],
      ),
    );
  }
}
