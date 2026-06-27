import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:fitit_app/shared/widgets/custom_textformfield.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final _formkey = GlobalKey<FormState>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _isLoading = false;

  Future<void> _handleSignUp() async {
    if (!_formkey.currentState!.validate()) return;
    setState(() {
      _isLoading = true;
    });
    //firebae auth goes here
    await Future.delayed(const Duration(seconds: 3));

    if (!mounted) return;
    setState(() {
      _isLoading = false;

      Navigator.pushReplacementNamed(context, "/home_screen");
    });
  }

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: context.verticalPadding,
                horizontal: context.horizontalPadding,
              ),
              child: Form(
                key: _formkey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    context.h(0.06).vSpace,
                    Center(
                      child: Text(
                        "Welcome back 👋",
                        style: textTheme.headlineLarge,
                      ),
                    ),
                    8.vSpace,
                    Center(
                      child: Text(
                        "Login to your account",
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.lightTextSub,
                        ),
                      ),
                    ),
                    24.vSpace,
                    Text("EMAIL", style: textTheme.labelMedium),
                    8.vSpace,
                    CustomTextFormField(
                      hint: "Enter your email",
                      prefixIcon: Icons.email,
                      validator: AppValidators.email,
                      controller: _emailController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    24.vSpace,
                    Text("PASSWORD", style: textTheme.labelMedium),
                    8.vSpace,
                    CustomTextFormField(
                      hint: "Enter your password",
                      controller: _passwordController,
                      prefixIcon: Icons.lock,
                      isPassword: true,
                      validator: AppValidators.password,
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.text,
                    ),
                    24.vSpace,
                    Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        "Forgot password?",
                        style: textTheme.bodyMedium!.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    24.vSpace,
                    ElevatedButton(
                      onPressed: () {
                        _isLoading ? null : _handleSignUp();
                      },
                      child: Text("Login"),
                    ),
                    24.vSpace,
                    Row(
                      children: [
                        Expanded(child: Divider(color: AppColors.lightTextSub)),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: AppSizes.sm,
                          ),
                          child: Text(
                            "OR CONTINUE WITH",
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.lightTextSub,
                            ),
                          ),
                        ),
                        Expanded(child: Divider(color: AppColors.lightTextSub)),
                      ],
                    ),
                    24.vSpace,
                    GestureDetector(
                      onTap: () {
                        //google login
                      },
                      child: Container(
                        width: context.screenWidth,
                        height: AppSizes.buttonHeight,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: AppColors.lightDivider,
                            width: 1.0,
                          ),
                          borderRadius: BorderRadius.circular(
                            AppSizes.radiusMd,
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/logo/google-logo.png",
                              height: AppSizes
                                  .iconLg, // Always specify size for icons
                              width: AppSizes.iconLg,
                            ),
                            8.hSpace,
                            Text(
                              "Contiue with Google",
                              style: textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    24.vSpace,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account? ",
                          style: textTheme.bodyMedium,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(
                              context,
                              '/signup_screen',
                            );
                          },
                          child: Text(
                            "Sign up",
                            style: textTheme.bodyMedium!.copyWith(
                              color: AppColors.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            if (_isLoading)
              Container(
                color: Colors.black.withValues(alpha: 102),
                child: Center(
                  child: CircularProgressIndicator(color: AppColors.primary),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
