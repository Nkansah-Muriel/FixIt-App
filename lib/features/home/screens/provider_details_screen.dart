import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:flutter/material.dart';

class ProviderDetailsScreen extends StatelessWidget {
  const ProviderDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                //blue container
                Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.horizontalPadding,
                        vertical: context.verticalPadding,
                      ),
                      width: context.screenWidth,
                      height: context.h(0.25),
                      decoration: BoxDecoration(color: AppColors.primary),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            style: IconButton.styleFrom(
                              backgroundColor: Color.fromRGBO(73, 115, 213, 1),
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: AppColors.lightSurface,
                              size: AppSizes.iconMd,
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(
                                    73,
                                    115,
                                    213,
                                    1,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.favorite_outline,
                                  color: AppColors.lightSurface,
                                  size: AppSizes.iconMd,
                                ),
                              ),
                              IconButton(
                                style: IconButton.styleFrom(
                                  backgroundColor: Color.fromRGBO(
                                    73,
                                    115,
                                    213,
                                    1,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  Icons.arrow_outward_outlined,
                                  color: AppColors.lightSurface,
                                  size: AppSizes.iconMd,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    //white container
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: context.horizontalPadding,
                        vertical: context.verticalPadding,
                      ),
                      width: context.screenWidth,
                      height: context.h(0.15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                        color: AppColors.lightSurface,
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.darkSurface.withOpacity(.09),
                            blurRadius:
                                3, // Increase this to make the shadow softer
                            spreadRadius:
                                1, // Optional: makes the shadow slightly larger
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "4.9",
                                style: textTheme.bodyLarge!.copyWith(
                                  color: AppColors.accent,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Rating", style: textTheme.bodySmall),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "312",
                                style: textTheme.bodyLarge!.copyWith(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("Reviews", style: textTheme.bodySmall),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "98%",
                                style: textTheme.bodyLarge!.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text("On time", style: textTheme.bodySmall),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Positioned(
                  top: context.h(
                    .20,
                  ), // Position it exactly where the two colors meet
                  left: context.w(.10),
                  child: Container(
                    padding: EdgeInsets.all(AppSizes.sm),
                    width: 90,
                    height: 90,
                    decoration: BoxDecoration(
                      color: AppColors.lightSurface,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 10,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromRGBO(251, 207, 232, 1),
                      child: Text("KM", style: textTheme.titleLarge),
                    ),
                  ),
                ),
              ],
            ),
            24.vSpace,
            //about section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: context.verticalPadding,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "About",
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  12.vSpace,
                  Text(
                    "Licensed master plumber serving Greater Accra. Specializes in leak detection, drain cleaning, and emergency repairs. Fluent in English & Twi.",
                    style: textTheme.bodyMedium,
                  ),
                  16.vSpace,
                  Text(
                    "Services & Pricing",
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  //services and pricing
                  ListTile(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
