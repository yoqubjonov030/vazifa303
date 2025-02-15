import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../core/app_colors.dart';
import 'onboarding_images.dart';

class OnBoardingViewV2 extends StatelessWidget {
  const OnBoardingViewV2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: AppBar(
        backgroundColor: AppColors.beigeColor,
        leading: Center(child: SvgPicture.asset("assets/svg/arrow.svg")),
      ),
      body: OnBoardingImages(
        image6: 'assets/images/drinks.png',
        image5: 'assets/images/macarons.png',
        image4: 'assets/images/broccolli.png',
        image3: 'assets/images/chicken_wrap.png',
        image2: "assets/images/waffles.png",
        image: "assets/images/baked_chicken.png",
      ),
      bottomNavigationBar: Container(
        height: 200,
        width: double.infinity,
        child: Column(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: Text(
                "Find the best recipes that the "
                "world can provide you"
                " also with every step that you can learn"
                " to increase your cooking skills.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Container(
              width: 207,
              height: 45,
              child: Center(
                child: Text(
                  "I'm New",
                  style: TextStyle(
                    color: AppColors.pinkSub,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFC6C9),
              ),
            ),
            Container(
              width: 207,
              height: 45,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Color(0xFFFFC6C9),
              ),
              child: Center(
                child: Text(
                  "I've Been Here",
                  style: TextStyle(
                    color: AppColors.pinkSub,
                    fontWeight: FontWeight.w600,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
