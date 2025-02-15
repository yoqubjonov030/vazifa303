import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:uy_ishi_17/core/app_colors.dart';
import 'categories_page_body.dart';
import 'categories_view_model.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({
    super.key,
    required this.viewModel,
  });

  final CategoriesViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: viewModel.load,
      child: ListenableBuilder(
        listenable: viewModel,
        builder: (context, child) => Scaffold(
          backgroundColor: AppColors.beigeColor,
          extendBody: true,
          appBar: AppBar(
          backgroundColor: AppColors.beigeColor,
            leading: Center(child: SvgPicture.asset("assets/svg/arrow.svg")),
            title: Text(
              "Categories",
              style: TextStyle(
                color: AppColors.pinkSub,
                fontWeight: FontWeight.w600,
                fontSize: 20,
              ),
            ),
            actions: [
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC6C9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(
                    child: SvgPicture.asset("assets/svg/notifications.svg")),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 28,
                height: 28,
                decoration: BoxDecoration(
                  color: Color(0xFFFFC6C9),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Center(child: SvgPicture.asset("assets/svg/search1.svg")),
              ),
            ],
            centerTitle: true,
          ),
          body: CategoriesPageBody(viewModel: viewModel, category: viewModel.mainCategory!,),
          bottomNavigationBar: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: 281,
              height: 56,
              decoration: BoxDecoration(
                color: Color(0xFFFD5D69),
                borderRadius: BorderRadius.circular(33),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SvgPicture.asset(
                    "assets/svg/home.svg",
                    width: 25,
                    height: 22,
                  ),
                  SvgPicture.asset(
                    "assets/svg/community.svg",
                    width: 25,
                    height: 22,
                  ),
                  SvgPicture.asset(
                    "assets/svg/categories.svg",
                    width: 25,
                    height: 22,
                  ),
                  SvgPicture.asset(
                    "assets/svg/profile.svg",
                    width: 25,
                    height: 22,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

