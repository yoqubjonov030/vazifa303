import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uy_ishi_17/core/app_colors.dart';
import '../../../core/sizes.dart';

class RecipePasswordFormField extends StatelessWidget {
  const RecipePasswordFormField({
    super.key,
    required this.controller,
    required this.title,
    required this.hintText,
    required this.validator,
  });

  final TextEditingController controller;
  final String title;
  final String hintText;
  final String? Function(String? value) validator;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        SizedBox(
          width: 357 * AppSizes.wRatio,
          child: TextFormField(
            textAlignVertical: TextAlignVertical.center,
            controller: controller,
            validator: validator,
            style: TextStyle(
              height: 1,
              color: AppColors.beigeColor,
            ),
            decoration: InputDecoration(
              suffix: SvgPicture.asset(
                "assets/svg/show_password.svg",
                width: 25,
                height: 21,
              ),
              filled: true,
              fillColor: Color(0xFFFFC6C9),
              hintText: "********",
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.beigeColor.withValues(alpha: 0.45),
              ),
              contentPadding: EdgeInsets.only(
                left: AppSizes.padding36,
                right: 20,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(
                  18,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
