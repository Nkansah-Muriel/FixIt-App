import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'features/auth/signup_screen.dart';
import 'features/auth/signin_screen.dart';
import 'features/onboarding/onboarding_screen.dart';
import 'features/onboarding/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // title: 'Flutter Demo',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // Use system theme mode
      home: SplashScreen(),
      routes: {
        '/onboarding_screen': (context) => const OnboardingScreen(),
        '/signup_screen': (context) => const SignupScreen(),
        '/signin_screen': (context) => const SigninScreen(),
      },
    );
  }
}
