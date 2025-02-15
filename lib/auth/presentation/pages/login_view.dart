import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // GoRouter import
import 'package:uy_ishi_17/auth/presentation/manager/login_view_model.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:uy_ishi_17/core/app_colors.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.vm});

  final LoginViewModel vm;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: vm,
      builder: (context, child) => Scaffold(
        backgroundColor: AppColors.beigeColor,
        appBar: AppBar(
          backgroundColor: AppColors.beigeColor,
          title: Text(
            "Login",
            style: TextStyle(
              color: AppColors.pinkSub,
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true,
        ),
        body: ListView(
          padding: EdgeInsets.only(top: 150),
          children: [
            Form(
              key: vm.formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Column(
                  spacing: 10,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RecipeTextFormField(
                      title: "Email",
                      hintText: "example@gmail.com",
                      validator: (value) => null,
                      controller: vm.loginController,
                    ),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: "password",
                      hintText: "********",
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 89,
            ),
            Center(
              child: GestureDetector(
                onTap: () async {
                  if (vm.formKey.currentState!.validate()) {
                    if (await vm.login() && context.mounted) {
                      context.go('/auth_informations');
                    } else {}
                  }
                },
                child: Container(
                  width: 207,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xFFFFC6C9),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Center(
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: AppColors.pinkSub,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 27,
            ),
            Center(
              child: Container(
                width: 207,
                height: 45,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC6C9),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                      color: AppColors.pinkSub,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
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
