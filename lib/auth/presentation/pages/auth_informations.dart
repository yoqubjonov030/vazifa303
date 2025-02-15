import 'package:flutter/material.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:uy_ishi_17/core/app_colors.dart';

class AuthInformations extends StatelessWidget {
  const AuthInformations({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.beigeColor,
      appBar: AppBar(
        title: Text(
          "Sign Up",
          style: TextStyle(
            color: AppColors.pinkSub,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.beigeColor,
      ),
      body: ListView(
        padding: EdgeInsets.only(top: 20, left: 30, right: 30),
        children: [
          Form(
            child: Column(
              spacing: 5,
              children: [
                RecipeTextFormField(
                  hintText: "John Doe",
                  validator: (value) => null,
                  controller: TextEditingController(),
                  title: "FullName",
                ),
                RecipeTextFormField(
                  hintText: "example@gmail.com",
                  validator: (value) => null,
                  controller: TextEditingController(),
                  title: "Email",
                ),
                RecipeTextFormField(
                  hintText: "+123456789",
                  validator: (value) => null,
                  controller: TextEditingController(),
                  title: "Mobile Number",
                ),
                RecipeTextFormField(
                  hintText: "DD/MM/YY",
                  validator: (value) => null,
                  controller: TextEditingController(),
                  title: "Date of Birth",
                ),
                RecipePasswordFormField(
                  controller: TextEditingController(),
                  title: 'password',
                  hintText: "*******",
                ),
                RecipePasswordFormField(
                  controller: TextEditingController(),
                  title: 'Confirm password',
                  hintText: "*******",
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Text(
                    textAlign: TextAlign.center,
                    "By continuing, you agree to "
                    "Terms of Use and Privacy Policy.",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: 194,
                  height: 45,
                  decoration: BoxDecoration(
                    color: AppColors.pinkSub,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Already have an account?  Log In",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w300,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
