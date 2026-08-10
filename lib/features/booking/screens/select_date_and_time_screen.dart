import 'package:fitit_app/app/routes.dart';
import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/widgets/custom_app.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDateAndTimeScreen extends StatefulWidget {
  const SelectDateAndTimeScreen({super.key});

  @override
  State<SelectDateAndTimeScreen> createState() =>
      _SelectDateAndTimeScreenState();
}

class _SelectDateAndTimeScreenState extends State<SelectDateAndTimeScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String? _selectedSlot;

  final List<String> _timeSlots = [
    '09:00',
    '10:30',
    '12:00',
    '13:30',
    '15:00',
    '16:30',
  ];

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: CustomAppBar(title: 'Select Date & Time'),
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
                  // ── Calendar card ─────────────────────────────
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: BorderRadius.circular(AppSizes.radiusLg),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          blurRadius: 10,
                          offset: const Offset(0, 10),
                        ),
                      ],
                    ),
                    child: TableCalendar(
                      firstDay: DateTime.now(),
                      lastDay: DateTime.now().add(const Duration(days: 90)),
                      focusedDay: _focusedDay,
                      selectedDayPredicate: (day) =>
                          isSameDay(_selectedDay, day),

                      onDaySelected: (selectedDay, focusedDay) {
                        setState(() {
                          _selectedDay = selectedDay;
                          _focusedDay = focusedDay;
                          _selectedSlot = null; // reset slot on date change
                        });
                      },

                      onPageChanged: (focusedDay) {
                        _focusedDay = focusedDay;
                      },

                      // disable past dates (firstDay handles this already)
                      enabledDayPredicate: (day) => day.isAfter(
                        DateTime.now().subtract(const Duration(days: 1)),
                      ),

                      calendarFormat: CalendarFormat.month,
                      availableCalendarFormats: const {
                        CalendarFormat.month: 'Month',
                      },

                      // ── Styling to match your app theme ────────
                      calendarStyle: CalendarStyle(
                        // selected day
                        selectedDecoration: const BoxDecoration(
                          color: AppColors.primary,
                          shape: BoxShape.circle,
                        ),
                        selectedTextStyle: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),

                        // today
                        todayDecoration: BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.primary,
                            width: 1.5,
                          ),
                        ),
                        todayTextStyle: const TextStyle(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w700,
                        ),

                        // disabled/past
                        disabledTextStyle: const TextStyle(
                          color: AppColors.lightTextSub,
                        ),

                        // default day
                        defaultTextStyle: TextStyle(
                          color: AppColors.lightTextMain,
                        ),

                        weekendTextStyle: TextStyle(
                          color: AppColors.lightTextMain,
                        ),

                        outsideDaysVisible: false,
                        cellMargin: const EdgeInsets.all(4),
                      ),

                      headerStyle: HeaderStyle(
                        formatButtonVisible: false,
                        titleCentered: true,
                        titleTextStyle: textTheme.titleMedium!,
                        leftChevronIcon: const Icon(
                          Icons.chevron_left_rounded,
                          color: AppColors.lightTextMain,
                        ),
                        rightChevronIcon: const Icon(
                          Icons.chevron_right_rounded,
                          color: AppColors.lightTextMain,
                        ),
                      ),

                      daysOfWeekStyle: DaysOfWeekStyle(
                        weekdayStyle: textTheme.bodySmall!.copyWith(
                          color: AppColors.lightTextSub,
                          fontWeight: FontWeight.w600,
                        ),
                        weekendStyle: textTheme.bodySmall!.copyWith(
                          color: AppColors.lightTextSub,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  24.vSpace,

                  // ── Time slots ────────────────────────────────
                  Text(
                    _selectedDay != null
                        ? 'Available Slots — ${_selectedDay!.day}/${_selectedDay!.month}'
                        : 'Available Slots',
                    style: textTheme.titleMedium,
                  ),
                  12.vSpace,

                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: _timeSlots.map((slot) {
                      final isSelected = _selectedSlot == slot;
                      return GestureDetector(
                        onTap: () => setState(() => _selectedSlot = slot),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSizes.lg,
                            vertical: AppSizes.md,
                          ),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.primary
                                : Theme.of(context).colorScheme.surface,
                            borderRadius: BorderRadius.circular(
                              AppSizes.radiusMd,
                            ),
                            border: Border.all(
                              color: isSelected
                                  ? AppColors.primary
                                  : AppColors.lightDivider,
                            ),
                            boxShadow: isSelected
                                ? []
                                : [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.04),
                                      blurRadius: 6,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                          ),
                          child: Text(
                            slot,
                            style: textTheme.bodyMedium?.copyWith(
                              color: isSelected
                                  ? Colors.white
                                  : AppColors.lightTextMain,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.w400,
                            ),
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                  32.vSpace,
                ],
              ),
            ),
          ),

          // ── Sticky continue button ──────────────────────────────
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
              onPressed: _selectedDay != null && _selectedSlot != null
                  ? () {
                      // TODO: navigate to address screen
                      // pass _selectedDay and _selectedSlot as arguments
                      Navigator.pushNamed(
                        context,
                        AppRoutes.serviceAddress,
                        arguments: {
                          'date': _selectedDay,
                          'time': _selectedSlot,
                        },
                      );
                    }
                  : null,
              child: const Text('Continue'),
            ),
          ),
        ],
      ),
    );
  }
}
