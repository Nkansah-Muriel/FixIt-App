import 'package:fitit_app/app/routes.dart';
import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/models/saved_address_model.dart';
import 'package:fitit_app/shared/widgets/custom_app.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart'; // 1. Import the package

class ServiceAddressScreen extends StatefulWidget {
  const ServiceAddressScreen({super.key});

  @override
  State<ServiceAddressScreen> createState() => _ServiceAddressScreenState();
}

class _ServiceAddressScreenState extends State<ServiceAddressScreen> {
  final TextEditingController _searchController = TextEditingController();
  int? _selectedIndex;

  // dummy data — replace with Firestore fetch later
  final List<SavedAddressModel> savedAddresses = [
    SavedAddressModel(
      title: 'Home',
      icon: Icons.home_outlined,
      address: '12 Boundary Rd, East Legon, Accra',
    ),
    SavedAddressModel(
      title: 'Office',
      icon: Icons.business_outlined,
      address: 'Ridge Towers, 5th Floor, Accra Central',
    ),
    SavedAddressModel(
      title: "Mom's place",
      icon: Icons.favorite_outline,
      address: '8 Palm Ave, Spintex, Accra',
    ),
    SavedAddressModel(
      title: 'Home Address 3',
      icon: Icons.home_outlined,
      address: '123 Main St, City, Country',
    ),
    SavedAddressModel(
      title: 'Home Address 4',
      icon: Icons.home_outlined,
      address: '123 Main St, City, Country',
    ),
  ];
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  bool get _isConfirmed =>
      _selectedIndex != null || _searchController.text.trim().isNotEmpty;
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Scaffold(
      appBar: CustomAppBar(title: 'Service Address'),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: context.horizontalPadding,
          vertical: context.verticalPadding,
        ),
        //scollable content
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 2. Wrap with DottedBorder
            DottedBorder(
              options: RoundedRectDottedBorderOptions(
                radius: Radius.circular(AppSizes.radiusLg),
                color: AppColors.primary,
                strokeWidth: 1.5,
                dashPattern: const [10, 5], // [dash length, space length]
              ),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSizes.lg,
                  vertical: AppSizes.md,
                ),
                width: context.screenWidth,
                // height: context.h(0.12), // 12% of screen height
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                      ),
                      child: Icon(
                        Icons.gps_fixed_outlined,
                        color: AppColors.lightBg,
                        size: 30,
                      ),
                    ),
                    12.hSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Use current location",
                            style: textTheme.bodyLarge?.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            "GPS enabled . accurate to 5m",
                            style: textTheme.bodyMedium?.copyWith(
                              color: AppColors.lightTextSub,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            40.vSpace,
            //search address-----
            Text(
              "SEARCH ADDRESS",
              style: textTheme.labelMedium?.copyWith(
                letterSpacing: 1,
                // color: AppColors.lightTextSub,
              ),
            ),
            16.vSpace,
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.search,
                  color: AppColors.lightTextSub,
                  size: AppSizes.iconMd,
                ),
                hintText: "Enter street, neighborhood ...",
              ),
              onChanged: (value) => setState(() {
                // Update the UI based on the search query
              }),
            ),
            40.vSpace,
            //saved addresses list----------
            Text(
              "Saved Addresses",
              style: textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
            ),
            16.vSpace,
            Expanded(
              child: ListView.separated(
                separatorBuilder: (_, __) => 12.vSpace,
                itemCount: savedAddresses.length,
                itemBuilder: (context, index) {
                  final address = savedAddresses[index];
                  final isSelected = _selectedIndex == index;
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      border: Border.all(
                        color: isSelected
                            ? AppColors.primary
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(
                        horizontal: AppSizes.md,
                        vertical: AppSizes.xs,
                      ),
                      leading: Container(
                        padding: const EdgeInsets.all(AppSizes.sm),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? AppColors.primary.withOpacity(0.1)
                              : AppColors.lightSurface,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          address.icon,
                          size: AppSizes.iconMd,
                          color: isSelected
                              ? AppColors.primary
                              : AppColors.lightTextSub,
                        ),
                      ),
                      //title and subtitle
                      title: Text(
                        address.title,
                        style: Theme.of(context).textTheme.titleMedium
                            ?.copyWith(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.lightTextMain,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w500,
                            ),
                      ),
                      subtitle: Text(
                        address.address,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: AppColors.lightTextSub,
                        ),
                      ),
                      // check or chevron on the right
                      trailing: isSelected
                          ? const Icon(
                              Icons.check_circle_rounded,
                              color: AppColors.primary,
                            )
                          : null,

                      onTap: () {
                        // Handle address selection
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
            20.vSpace,
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: AppSizes.md,
              ),
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
              child: ElevatedButton(
                onPressed: _isConfirmed
                    ? () => Navigator.pushNamed(context, AppRoutes.orderSummary)
                    : null,
                child: const Text('Confirm Address'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
