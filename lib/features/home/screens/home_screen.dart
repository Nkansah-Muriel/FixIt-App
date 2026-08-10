import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/models/service_category_model.dart';
import 'package:flutter/material.dart';

import '../../../shared/models/top_rated_provider_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Category> categories = [
    Category("Cleaning", "assets/logo/cleaning.png"),
    Category("Plumbing", "assets/logo/plumbing.png"),
    Category("Electrical", "assets/logo/electrical.png"),
    Category("Painting", "assets/logo/painting.png"),
    Category("AC Repair", "assets/logo/ac-repair.png"),
    Category("Pest Control", "assets/logo/pest-control.png"),
    Category("Carpentry", "assets/logo/carpentry.png"),
    Category("More", "assets/logo/more.png"),
  ];

  final List<TopRatedProvider> topRatedProviders = [
    TopRatedProvider(
      initials: "YA",
      avatarColor: Color.fromRGBO(173, 216, 230, 1),
      name: "Yaw Asante",
      profession: "Plumber",
      rating: 4.7,
      reviews: 198,
    ),
    TopRatedProvider(
      initials: "EA",
      avatarColor: Color.fromRGBO(144, 238, 144, 1),
      name: "Eric Ansong",
      profession: "Electrician",
      rating: 4.9,
      reviews: 312,
    ),
    TopRatedProvider(
      initials: "DF",
      avatarColor: Color.fromRGBO(255, 218, 185, 1),
      name: "Donald Frimpong",
      profession: "AC Repair",
      rating: 4.8,
      reviews: 256,
    ),
    TopRatedProvider(
      initials: "KB",
      avatarColor: Color.fromRGBO(255, 182, 193, 1),
      name: "Kofi Boateng",
      profession: "Carpenter",
      rating: 4.6,
      reviews: 89,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ── Top section (padded) ──────────────────────────────────
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: context.horizontalPadding,
                  vertical: context.verticalPadding,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.h(0.01).vSpace,

                    // ── Header row ──────────────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 24,
                              backgroundColor: AppColors.primary,
                            ),
                            12.hSpace,
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      size: AppSizes.iconSm,
                                      color: AppColors.accent,
                                    ),
                                    4.hSpace,
                                    Text(
                                      "Accra, Ghana",
                                      style: textTheme.bodySmall?.copyWith(
                                        color: AppColors.lightTextSub,
                                      ),
                                    ),
                                  ],
                                ),
                                4.vSpace,
                                Text(
                                  "Hi, Muriel 👋",
                                  style: textTheme.headlineMedium,
                                ),
                              ],
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(
                            Icons.notifications_outlined,
                            size: AppSizes.iconLg,
                          ),
                        ),
                      ],
                    ),
                    24.vSpace,

                    // ── Search bar ──────────────────────────────────────
                    TextField(
                      decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: AppSizes.iconMd,
                          color: AppColors.lightTextSub,
                        ),
                        hintText: "Search for a service...",
                        suffixIcon: Icon(
                          Icons.filter_alt_outlined,
                          color: AppColors.primary,
                        ),
                      ),
                    ),
                    24.vSpace,

                    // ── Promo banner ────────────────────────────────────
                    Container(
                      padding: const EdgeInsets.all(AppSizes.lg),
                      width: context.screenWidth,
                      height: context.h(0.22),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: AppSizes.xs,
                                  horizontal: AppSizes.sm,
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(68, 120, 235, 1),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.radiusSm,
                                  ),
                                ),
                                child: Text(
                                  "LIMITED",
                                  style: textTheme.labelSmall?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    letterSpacing: 1,
                                  ),
                                ),
                              ),
                              10.vSpace,
                              Text(
                                "30% off your\nfirst cleaning",
                                style: textTheme.headlineMedium?.copyWith(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              10.vSpace,
                              Text(
                                "Use code FIXIT30",
                                style: textTheme.bodySmall?.copyWith(
                                  color: Colors.white70,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                          Container(
                            height: 100,
                            width: 100,

                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/logo/cleaning.png"),
                              ),
                              color: Color.fromRGBO(68, 120, 235, 1),
                              borderRadius: BorderRadius.circular(
                                AppSizes.radiusLg,
                              ),
                            ),
                            // child: Image.asset("assets/logo/cleaning.png"),
                          ),
                        ],
                      ),
                    ),
                    24.vSpace,

                    // ── Categories header ───────────────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Categories", style: textTheme.titleLarge),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See all",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.vSpace,

                    // ── Categories grid ─────────────────────────────────
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: categories.length,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            crossAxisSpacing: 12,
                            mainAxisSpacing: 12,
                          ),
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/category_screen',
                            arguments: categories[index],
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  AppSizes.radiusSm,
                                ),
                              ),
                              child: Image.asset(
                                categories[index].categoryUrl,
                                width: 48,
                                height: 48,
                              ),
                            ),
                            6.vSpace,
                            Text(
                              categories[index].categoryName,
                              style: textTheme.bodySmall?.copyWith(
                                color: AppColors.lightTextMain,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.vSpace,

                    // ── Top Rated Providers header ──────────────────────
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Top Rated Providers",
                          style: textTheme.titleLarge,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "See all",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    16.vSpace,
                  ],
                ),
              ),

              // ── Provider cards (edge-to-edge horizontal scroll) ───────
              SizedBox(
                height: 230,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(
                    horizontal: context.horizontalPadding,
                  ),
                  itemCount: topRatedProviders.length,
                  separatorBuilder: (_, __) => 12.hSpace,
                  itemBuilder: (context, index) {
                    final provider = topRatedProviders[index];
                    return _ProviderCard(provider: provider);
                  },
                ),
              ),
              24.vSpace,
            ],
          ),
        ),
      ),
    );
  }
}

// ─── Provider card widget ──────────────────────────────────────────────────────

class _ProviderCard extends StatelessWidget {
  final TopRatedProvider provider;

  const _ProviderCard({required this.provider});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      width: 155,
      padding: const EdgeInsets.all(AppSizes.md),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.06),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Avatar
          CircleAvatar(
            radius: 32,
            backgroundColor: provider.avatarColor,
            child: Text(
              provider.initials,
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.lightTextMain,
              ),
            ),
          ),
          10.vSpace,

          // Name
          Text(
            provider.name,
            style: textTheme.titleMedium?.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
          ),
          2.vSpace,

          // Profession
          Text(
            provider.profession,
            style: textTheme.bodySmall?.copyWith(color: AppColors.lightTextSub),
          ),
          8.vSpace,

          // Rating
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.star_rounded, color: Colors.amber, size: 15),
              4.hSpace,
              Text(
                "${provider.rating}  (${provider.reviews})",
                style: textTheme.bodySmall?.copyWith(
                  color: AppColors.lightTextMain,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          12.vSpace,

          // Book Now button
          SizedBox(
            width: double.infinity,
            height: 34,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/provider_details_screen");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
                padding: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(AppSizes.radiusSm),
                ),
                textStyle: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                ),
              ),
              child: const Text('Book Now'),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Models ────────────────────────────────────────────────────────────────────
