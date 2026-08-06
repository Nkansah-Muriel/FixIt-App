import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/models/reviews_model.dart';
import 'package:fitit_app/shared/models/service_item_model.dart';
import 'package:fitit_app/shared/widgets/review_card.dart';
import 'package:flutter/material.dart';

class ProviderDetailsScreen extends StatelessWidget {
  const ProviderDetailsScreen({super.key});

  static const List<ServiceItem> services = [
    ServiceItem(name: "Leak Detection & Repair", price: 50.0),
    ServiceItem(name: "Drain Cleaning", price: 75.0),
    ServiceItem(name: "Emergency Repairs", price: 100.0),
  ];

  static List<ReviewModel> reviews = [
    ReviewModel(
      name: 'Esi Amoah',
      initials: 'EA',
      avatarColor: Color.fromRGBO(173, 216, 230, 1),
      rating: 5,
      comment: 'Fixed our kitchen leak in 30 min. Super professional!',
      date: 'Jun 12',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Column(
          //header stack (blue + white + avatar)
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                //blue section
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
                    //white stats section
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
                          _StatColumn(
                            value: "4.8",
                            label: "Rating",
                            color: AppColors.accent,
                            textTheme: textTheme,
                          ),
                          _StatColumn(
                            value: "312",
                            label: "Reviews",
                            color: AppColors.primary,
                            textTheme: textTheme,
                          ),
                          _StatColumn(
                            value: "98%",
                            label: "On time",
                            color: AppColors.success,
                            textTheme: textTheme,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                //floating avatar
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
            //scrollable content section
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // About
                    Text('About', style: textTheme.titleLarge),
                    12.vSpace,
                    Text(
                      'Licensed master plumber serving Greater Accra. '
                      'Specializes in leak detection, drain cleaning, and '
                      'emergency repairs. Fluent in English & Twi.',
                      style: textTheme.bodyMedium,
                    ),
                    24.vSpace,

                    // Services & Pricing
                    Text('Services & Pricing', style: textTheme.titleLarge),
                    12.vSpace,

                    // ── Service list
                    ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: services.length,
                      separatorBuilder: (_, __) => const Divider(
                        height: 1,
                        color: AppColors.darkDivider,
                      ),
                      itemBuilder: (context, index) {
                        final service = services[index];
                        return ListTile(
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: AppSizes.xs,
                          ),
                          title: Text(
                            service.name,
                            style: textTheme.bodyMedium,
                          ),
                          trailing: Text(
                            service.price.toStringAsFixed(2),
                            style: textTheme.titleMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      },
                    ),
                    24.vSpace,
                    //reviews section
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Reviews (312)", style: textTheme.titleLarge),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/all_reviews_screen');
                          },
                          child: Text(
                            'See all',
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    12.vSpace,
                    // ── Review list
                    ReviewCard(review: reviews[0]),
                    24.vSpace,
                    // ── Sticky bottom bar ─────────────────────────────────────────
                    Container(
                      padding: EdgeInsets.symmetric(vertical: AppSizes.md),
                      decoration: BoxDecoration(
                        color: Theme.of(context).scaffoldBackgroundColor,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 10,
                            offset: const Offset(0, -4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'STARTS FROM',
                                style: textTheme.labelSmall?.copyWith(
                                  color: AppColors.lightTextSub,
                                  letterSpacing: 1,
                                ),
                              ),
                              4.vSpace,
                              Row(
                                children: [
                                  Text(
                                    '₵60',
                                    style: textTheme.headlineLarge?.copyWith(
                                      color: AppColors.primary,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  Text(
                                    '/hr',
                                    style: textTheme.bodyMedium?.copyWith(
                                      color: AppColors.lightTextSub,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            width: context.w(0.35),
                            height: AppSizes.buttonHeight,
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.accent,
                              ),
                              child: Text(
                                'Book Now',
                                style: textTheme.bodyLarge?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lightSurface,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ── Reusable stat column
class _StatColumn extends StatelessWidget {
  final String value;
  final String label;
  final Color color;
  final TextTheme textTheme;

  const _StatColumn({
    required this.value,
    required this.label,
    required this.color,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          value,
          style: textTheme.bodyLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
        4.vSpace,
        Text(label, style: textTheme.bodySmall),
      ],
    );
  }
}
