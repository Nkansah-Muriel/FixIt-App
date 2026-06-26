import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startAnimation();
  }

  void _startAnimation() async {
    // wait a tiny bit before starting the animation
    await Future.delayed(const Duration(milliseconds: 500));
    if (mounted) {
      setState(() {
        _opacity = 1.0;
      });
    }

    // wait for the animation and splash screen
    await Future.delayed(const Duration(seconds: 3));

    // move to next screen
    if (mounted) {
      Navigator.pushReplacementNamed(context, '/onboarding_screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // This ensures the background reaches the very top under the status bar
      extendBodyBehindAppBar: true,
      body: Container(
        // Forces the container to take all available space
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/fixit-splash-bg.png'),
            fit: BoxFit.cover, // Ensures the image covers the whole area
          ),
        ),
        // Your content here
        child: AnimatedOpacity(
          opacity: _opacity,
          duration: const Duration(seconds: 1),
          curve: Curves.easeIn,
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo here
              Icon(Icons.auto_fix_high_sharp, size: 100, color: Colors.white),
              Text(
                "FixIt",
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "Quality service at your doorstep",
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
