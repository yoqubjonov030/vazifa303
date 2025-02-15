import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:uy_ishi_17/core/app_colors.dart';
import 'onboarding_view_model.dart';
import 'onboarding_view_v2.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key, required this.ovm});

  final OnboardingViewModel ovm;

  @override
  _OnboardingViewState createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: widget.ovm,
      builder: (context, child) => PageView.builder(
        controller: _pageController,
        itemCount: widget.ovm.pages.length + 1,
        itemBuilder: (context, index) => Scaffold(
          backgroundColor: AppColors.beigeColor,
          appBar: AppBar(
            backgroundColor: AppColors.beigeColor,
            leading: Center(
              child: Visibility(
                visible: widget.ovm.pages[index].order == 2,
                child: SvgPicture.asset(
                  "assets/svg/arrow.svg",
                  width: 30,
                  height: 20,
                ),
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 100),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.ovm.pages[index].title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      widget.ovm.pages[index].subtitle,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 40,
                    )
                  ],
                ),
              ),
            ),
          ),
          body: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.network(
                widget.ovm.pages[index].image,
                width: double.infinity,
                height: 741,
                fit: BoxFit.cover,
              ),
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  width: double.infinity,
                  height: 286,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [AppColors.beigeColor, Colors.transparent],
                      stops: [0.3, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: 286,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.beigeColor, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
              ),
              Positioned(
                bottom: 48,
                child: GestureDetector(
                  onTap: () {
                    if (_pageController.page == widget.ovm.pages.length - 1) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OnBoardingViewV2()),
                      );
                    } else {
                      _pageController.nextPage(
                        duration: Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
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
                        "Continue",
                        style: TextStyle(
                          color: Color(0xFFEC888D),
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




