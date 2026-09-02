import 'package:fitit_app/app/routes.dart';
import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/widgets/custom_app.dart';
import 'package:flutter/material.dart';

class OrderSummaryScreen extends StatefulWidget {
  const OrderSummaryScreen({super.key});

  @override
  State<OrderSummaryScreen> createState() => _OrderSummaryScreenState();
}

class _OrderSummaryScreenState extends State<OrderSummaryScreen> {
  // dummy data — replace with Provider later
  final String _providerName = 'Kwame Mensah';
  final String _providerInitials = 'KM';
  final Color _providerColor = Color.fromRGBO(251, 207, 232, 1);
  final double _providerRating = 4.9;
  final String _providerJob = 'Plumbing';
  final String _service = 'Leak Detection & Repair';
  final String _dateTime = 'Fri, Nov 14 · 13:30';
  final String _address = '12 Boundary Rd, East Legon';
  final String _duration = '~1.5 hours';
  final double _serviceFee = 127.50;
  final double _platformFee = 12.00;
  final double _discount = 38.25;
  final String _promoCode = 'FIXIT30';

  bool _promoApplied = true;
  final TextEditingController _promoController = TextEditingController();

  double get _total =>
      _serviceFee + _platformFee - (_promoApplied ? _discount : 0);

  @override
  void dispose() {
    _promoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(title: 'Order Summary'),
      body: Column(
        children: [
          // ── Scrollable content ──────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: context.horizontalPadding,
                vertical: AppSizes.md,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ── Provider info card ──────────────────────────
                  Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Avatar
                        CircleAvatar(
                          radius: 28,
                          backgroundColor: _providerColor,
                          child: Text(
                            _providerInitials,
                            style: textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: AppColors.lightTextMain,
                            ),
                          ),
                        ),
                        12.hSpace,

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Name + verified badge
                            Row(
                              children: [
                                Text(
                                  _providerName,
                                  style: textTheme.titleMedium?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                4.hSpace,
                                const Icon(
                                  Icons.verified_rounded,
                                  color: AppColors.primary,
                                  size: 16,
                                ),
                              ],
                            ),
                            6.vSpace,

                            // Rating + profession
                            Row(
                              children: [
                                const Icon(
                                  Icons.star_rounded,
                                  color: Colors.amber,
                                  size: 14,
                                ),
                                4.hSpace,
                                Text(
                                  '$_providerRating · $_providerJob',
                                  style: textTheme.bodySmall?.copyWith(
                                    color: AppColors.lightTextSub,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  24.vSpace,

                  // ── Booking details card ────────────────────────
                  Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _DetailRow(
                          label: 'Service',
                          value: _service,
                          textTheme: textTheme,
                        ),
                        const Divider(height: 24),
                        _DetailRow(
                          label: 'Date & Time',
                          value: _dateTime,
                          textTheme: textTheme,
                        ),
                        const Divider(height: 24),
                        _DetailRow(
                          label: 'Address',
                          value: _address,
                          textTheme: textTheme,
                        ),
                        const Divider(height: 24),
                        _DetailRow(
                          label: 'Duration',
                          value: _duration,
                          textTheme: textTheme,
                        ),
                      ],
                    ),
                  ),
                  24.vSpace,

                  // ── Promo code ──────────────────────────────────
                  if (_promoApplied)
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.md,
                        vertical: AppSizes.sm,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.success.withOpacity(0.08),
                        borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                        border: Border.all(
                          color: AppColors.success.withOpacity(0.3),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.local_offer_outlined,
                                color: AppColors.success,
                                size: AppSizes.iconMd,
                              ),
                              8.hSpace,
                              Text(
                                _promoCode,
                                style: textTheme.bodyMedium?.copyWith(
                                  color: AppColors.success,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              4.hSpace,
                              Text(
                                'applied',
                                style: textTheme.bodySmall?.copyWith(
                                  color: AppColors.success,
                                ),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () => setState(() => _promoApplied = false),
                            child: const Icon(
                              Icons.close_rounded,
                              size: AppSizes.iconSm,
                              color: AppColors.lightTextSub,
                            ),
                          ),
                        ],
                      ),
                    )
                  else
                    // promo input when not applied
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _promoController,
                            decoration: const InputDecoration(
                              hintText: 'Enter promo code',
                              prefixIcon: Icon(Icons.local_offer_outlined),
                            ),
                          ),
                        ),
                        8.hSpace,
                        ElevatedButton(
                          onPressed: () {
                            if (_promoController.text.trim().toUpperCase() ==
                                _promoCode) {
                              setState(() => _promoApplied = true);
                              _promoController.clear();
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size(80, 52),
                          ),
                          child: const Text('Apply'),
                        ),
                      ],
                    ),
                  24.vSpace,

                  // ── Price breakdown ─────────────────────────────
                  Container(
                    padding: const EdgeInsets.all(AppSizes.md),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusMd),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        _PriceRow(
                          label: 'Service fee',
                          value: '₵${_serviceFee.toStringAsFixed(2)}',
                          textTheme: textTheme,
                        ),
                        12.vSpace,
                        _PriceRow(
                          label: 'Platform fee',
                          value: '₵${_platformFee.toStringAsFixed(2)}',
                          textTheme: textTheme,
                        ),
                        if (_promoApplied) ...[
                          12.vSpace,
                          _PriceRow(
                            label: 'Discount (30%)',
                            value: '-₵${_discount.toStringAsFixed(2)}',
                            textTheme: textTheme,
                            valueColor: AppColors.error,
                          ),
                        ],
                        const Divider(height: 24),
                        _PriceRow(
                          label: 'Total',
                          value: '₵${_total.toStringAsFixed(2)}',
                          textTheme: textTheme,
                          isTotal: true,
                          valueColor: AppColors.primary,
                        ),
                      ],
                    ),
                  ),
                  32.vSpace,
                ],
              ),
            ),
          ),

          // ── Sticky bottom button ────────────────────────────────
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
              onPressed: () {
                Navigator.pushNamed(context, AppRoutes.payment);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.accent,
              ),
              child: const Text('Proceed to Payment'),
            ),
          ),
        ],
      ),
    );
  }
}

// ── Detail row (label left, value right) ──────────────────────────────────────
class _DetailRow extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;

  const _DetailRow({
    required this.label,
    required this.value,
    required this.textTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: textTheme.bodyMedium?.copyWith(color: AppColors.lightTextSub),
        ),
        Text(
          value,
          style: textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: AppColors.lightTextMain,
          ),
        ),
      ],
    );
  }
}

// ── Price row ─────────────────────────────────────────────────────────────────
class _PriceRow extends StatelessWidget {
  final String label;
  final String value;
  final TextTheme textTheme;
  final bool isTotal;
  final Color? valueColor;

  const _PriceRow({
    required this.label,
    required this.value,
    required this.textTheme,
    this.isTotal = false,
    this.valueColor,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? textTheme.titleMedium
              : textTheme.bodyMedium?.copyWith(color: AppColors.lightTextSub),
        ),
        Text(
          value,
          style: isTotal
              ? textTheme.titleLarge?.copyWith(
                  color: valueColor ?? AppColors.lightTextMain,
                  fontWeight: FontWeight.w700,
                )
              : textTheme.bodyMedium?.copyWith(
                  color: valueColor ?? AppColors.lightTextMain,
                  fontWeight: FontWeight.w600,
                ),
        ),
      ],
    );
  }
}
