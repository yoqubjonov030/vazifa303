import 'package:flutter/material.dart';
import 'package:uy_ishi_17/core/app_colors.dart';
import 'package:uy_ishi_17/core/sizes.dart';

class RecipeTextFormField extends StatelessWidget {
  const RecipeTextFormField({
    super.key,
    required this.hintText,
    required this.validator,
    required this.controller,
    required this.title,
  });

  final String hintText, title;
  final String? Function(String? value) validator;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          width: 357 * AppSizes.wRatio,
          child: TextFormField(
            controller: controller,
            validator: validator,
            style: TextStyle(
              height: 1,
              color: AppColors.beigeColor,
            ),
            decoration: InputDecoration(
              filled: true,
              fillColor: Color(0xFFFFC6C9),
              hintText: hintText,
              hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: AppColors.beigeColor.withValues(alpha: 0.45),
              ),
              contentPadding:
                  EdgeInsets.symmetric(horizontal: AppSizes.padding36),
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
