import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uy_ishi_17/auth/data/models/sign_up_view_model.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/auth_informations_show_dialog.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_date_of_birth_field.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_password_form_field.dart';
import 'package:uy_ishi_17/auth/presentation/widgets/recipe_text_form_field.dart';
import 'package:uy_ishi_17/core/app_colors.dart';

class AuthInformations extends StatelessWidget {
  const AuthInformations({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SignUpViewModel>(
      create: (context) => SignUpViewModel(authRepo: context.read()),
      builder: (context, child) {
        final vm = context.read<SignUpViewModel>();
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
            padding: EdgeInsets.symmetric(horizontal: 30),
            children: [
              Form(
                key: vm.formKey,
                child: Column(
                  children: [
                    RecipeTextFormField(
                      hintText: "John",
                      validator: (value) => null,
                      controller: vm.firstNameController,
                      title: "First Name",
                    ),
                    RecipeTextFormField(
                      hintText: "Doe",
                      validator: (value) => null,
                      controller: vm.lastNameNameController,
                      title: "Last Name",
                    ),
                    RecipeTextFormField(
                      hintText: "username",
                      validator: (value) => null,
                      controller: vm.usernameController,
                      title: "Username",
                    ),
                    RecipeTextFormField(
                      hintText: "example@gmail.com",
                      validator: (value) => null,
                      controller: vm.emailController,
                      title: "Email",
                    ),
                    RecipeTextFormField(
                      hintText: "+998911234567",
                      validator: (value) => null,
                      controller: vm.numberController,
                      title: "Phone Number",
                    ),
                    RecipeDateOfBirthField(),
                    RecipePasswordFormField(
                      controller: vm.passwordController,
                      title: "Password",
                      hintText: "*********",
                      validator: (value) => null,
                    ),
                    RecipePasswordFormField(
                      controller: vm.confirmPasswordController,
                      title: "Confirm Password",
                      hintText: "********",
                      validator: (value) {
                        if (vm.passwordController.text !=
                            vm.confirmPasswordController.text) {
                          return "Password do not match";
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: GestureDetector(
                        child: Container(
                          width: 195,
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
                                fontFamily: "Poppins",
                                fontWeight: FontWeight.w600,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        ),
                        onTap: () async {
                          if (vm.formKey.currentState!.validate()) {
                            bool success = await vm.signUp();
                            if (success) {
                              showDialog(
                                context: context,
                                builder: (context) =>
                                    AuthInformationsShowDialog(),
                              );
                            }
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
