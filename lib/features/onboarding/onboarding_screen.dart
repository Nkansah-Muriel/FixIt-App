import 'package:dots_indicator/dots_indicator.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/theme.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            //swapable area for onboarding content
            Expanded(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;
                  });
                },
                children: [
                  OnboardingView(
                    imgPath: 'assets/logo/fixit-logo-screen2.png',
                    headText: 'Find trusted professionals',
                    subText:
                        'Discover verified plumbers, electricians, and more - vetted and rated by your neighbours.',
                    onNext: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    containerColor: Color.fromRGBO(239, 244, 255, 1),
                  ),
                  OnboardingView(
                    imgPath: 'assets/logo/fixit-logo-screen3.png',
                    headText: 'Book in seconds',
                    subText:
                        'Pick a service, choose a slot, and we will match you with a top-reated professional near you instantly.',
                    onNext: () {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeIn,
                      );
                    },
                    containerColor: Color.fromRGBO(255, 244, 239, 1),
                  ),
                  OnboardingView(
                    imgPath: 'assets/logo/fixit-logo-screen2.png',
                    headText: 'Hire with confidence',
                    subText:
                        'Read reviews and hire the best professionals for your job',
                    onNext: () {
                      // Navigate to the main app screen
                    },
                    containerColor: Color.fromRGBO(244, 255, 236, 1),
                    isLastPage: true,
                    footer: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signup_screen');
                          },
                          child: const Text('Get Started'),
                        ),
                        20.vSpace,
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/signin_screen');
                          },
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(
                              context.screenWidth,
                              AppSizes.buttonHeight,
                            ),
                            side: const BorderSide(
                              color: AppColors.primary,
                              width: 1,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusMd,
                              ),
                            ),
                            backgroundColor: AppColors.lightSurface,
                          ),
                          child: Text(
                            'I already have an account',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (_currentPage != 2)
              Padding(
                padding: EdgeInsets.only(bottom: AppSizes.lg),
                child: DotsIndicator(
                  dotsCount: 3,
                  position: _currentPage.toDouble(),
                  decorator: DotsDecorator(
                    activeColor: AppColors.primary,
                    size: const Size.square(9.0),
                    activeSize: const Size(30, 9),
                    activeShape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
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

class OnboardingView extends StatelessWidget {
  const OnboardingView({
    super.key,
    required this.imgPath,
    required this.headText,
    required this.subText,
    required this.onNext,
    this.isLastPage = false,
    required this.containerColor,
    this.footer,
  });
  final String imgPath;
  final String headText;
  final String subText;
  final VoidCallback onNext;
  final bool isLastPage;
  final Color containerColor;
  final Widget? footer;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Padding(
      padding: EdgeInsets.all(AppSizes.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  // Navigate to the main app screen
                },
                child: Text('Skip', style: textTheme.bodySmall),
              ),
            ],
          ),
          Center(
            child: Container(
              margin: EdgeInsets.fromLTRB(0, AppSizes.xxl, 0, AppSizes.xxl),
              height: 330,
              decoration: BoxDecoration(
                color: containerColor,
                borderRadius: BorderRadius.circular(AppSizes.radiusXl),
              ),
              child: Image.asset(imgPath, fit: BoxFit.cover),
            ),
          ),
          Text(headText, style: textTheme.displayMedium),
          Padding(
            padding: EdgeInsets.only(top: AppSizes.md),
            child: Text(
              subText,
              style: textTheme.titleMedium!.copyWith(
                color: AppColors.lightTextSub,
              ),
            ),
          ),
          const Spacer(),
          if (footer != null) footer!,
        ],
      ),
    );
  }
}
