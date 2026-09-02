import 'package:fitit_app/features/auth/signin_screen.dart';
import 'package:fitit_app/features/auth/signup_screen.dart';
import 'package:fitit_app/features/booking/screens/order_summary_screen.dart';
import 'package:fitit_app/features/booking/screens/payment_screen.dart';
import 'package:fitit_app/features/booking/screens/service_address_screen.dart';
import 'package:fitit_app/features/home/screens/all_reviews_screen.dart';
import 'package:fitit_app/features/home/screens/home_screen.dart';
import 'package:fitit_app/features/home/screens/provider_details_screen.dart';
import 'package:fitit_app/features/onboarding/onboarding_screen.dart';
import 'package:fitit_app/features/onboarding/splash_screen.dart';
import 'package:fitit_app/features/booking/screens/select_date_and_time_screen.dart';
import 'package:flutter/material.dart';

import '../features/home/screens/service_categories.dart';
import '../shared/models/service_category_model.dart';

class AppRoutes {
  AppRoutes._();

  // ── Route names ────────────────────────────────────────────────
  static const splash = '/';
  static const onboarding = '/onboarding_screen';
  static const signup = '/signup_screen';
  static const signin = '/signin_screen';
  static const home = '/home_screen';
  static const category = '/category_screen';
  static const providerDetails = '/provider_details_screen';
  static const allReviews = '/all_reviews_screen';
  static const selectDateAndTime = '/select_date_and_time_screen';
  static const serviceAddress = '/service_address_screen';
  static const orderSummary = '/order_summary_screen';
  static const payment = '/payment_screen';

  // ── Route map ──────────────────────────────────────────────────
  static Map<String, WidgetBuilder> get routes => {
    splash: (_) => const SplashScreen(),
    onboarding: (_) => const OnboardingScreen(),
    signup: (_) => const SignupScreen(),
    signin: (_) => const SigninScreen(),
    home: (_) => const HomeScreen(),
    providerDetails: (_) => const ProviderDetailsScreen(),
    allReviews: (_) => const AllReviewsScreen(),
    selectDateAndTime: (_) => const SelectDateAndTimeScreen(),
    serviceAddress: (_) => const ServiceAddressScreen(),
    orderSummary: (_) => const OrderSummaryScreen(),
    payment: (_) => const PaymentScreen(),
  };

  // ── Routes that need arguments go here ─────────────────────────
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case category:
        final data = settings.arguments as Category;
        return MaterialPageRoute(
          builder: (_) => CategoryScreen(category: data),
        );

      default:
        // fallback — should never hit this if routes are set up correctly
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text('Page not found'))),
        );
    }
  }
}
