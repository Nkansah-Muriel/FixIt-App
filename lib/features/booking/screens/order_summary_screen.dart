import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/widgets/custom_app.dart';
import 'package:flutter/material.dart';

class OrderSummyScreen extends StatelessWidget {
  const OrderSummyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(title: "Order Summary"),
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
            vertical: context.verticalPadding,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  //circle avatar with initials
                  CircleAvatar(
                    radius: 25,
                    backgroundColor: Color.fromRGBO(251, 207, 232, 1),
                    child: Text("KM", style: textTheme.headlineLarge),
                  ),
                  //column with name and service and rating and verified check
                  Padding(
                    padding: EdgeInsets.only(left: AppSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "Kwame Mensah",
                              style: textTheme.headlineMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: AppSizes.xs),
                              child: Icon(
                                Icons.verified_outlined,
                                color: AppColors.primary,
                                size: 18,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(Icons.star, color: AppColors.accent, size: 18),
                            //rating
                            Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: AppSizes.sm,
                              ),
                              child: Text(
                                "4.9",
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.lightTextSub,
                                ),
                              ),
                            ),
                            Text(
                              "Plumbing",
                              style: textTheme.bodyMedium?.copyWith(
                                color: AppColors.lightTextSub,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              40.vSpace,

              //service order history
            ],
          ),
        ),
      ),
    );
  }
}
