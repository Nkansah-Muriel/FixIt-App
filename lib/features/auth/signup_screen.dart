import 'package:fitit_app/core/constants.dart';
import 'package:fitit_app/core/extensions.dart';
import 'package:fitit_app/core/theme.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _obscurePassword = true;
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: context.horizontalPadding,
            vertical: context.verticalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.vSpace,
              Center(
                child: Text(
                  "Create your account",
                  style: textTheme.headlineLarge,
                ),
              ),
              8.vSpace,
              Center(
                child: Text(
                  "Join us and start your journey!",
                  style: textTheme.bodyMedium!.copyWith(
                    color: AppColors.lightTextSub,
                  ),
                ),
              ),
              24.vSpace,
              Text("FULL NAME", style: textTheme.labelMedium),
              8.vSpace,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your full name",
                  prefixIcon: Icon(
                    Icons.person,
                    size: AppSizes.iconMd,
                    color: AppColors.lightTextSub,
                  ),
                ),
              ),
              24.vSpace,
              Text("EMAIL", style: textTheme.labelMedium),
              8.vSpace,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  prefixIcon: Icon(
                    Icons.email,
                    size: AppSizes.iconMd,
                    color: AppColors.lightTextSub,
                  ),
                ),
              ),
              24.vSpace,
              Text("PHONE NUMBER", style: textTheme.labelMedium),
              8.vSpace,
              TextFormField(
                decoration: InputDecoration(
                  hintText: "Enter your phone number",
                  prefixIcon: Icon(
                    Icons.phone,
                    size: AppSizes.iconMd,
                    color: AppColors.lightTextSub,
                  ),
                ),
              ),
              24.vSpace,
              Text("PASSWORD", style: textTheme.labelMedium),
              8.vSpace,
              TextFormField(
                obscureText: _obscurePassword,
                obscuringCharacter: '*',
                decoration: InputDecoration(
                  hintText: "Enter your password",
                  prefixIcon: Icon(
                    Icons.lock,
                    size: AppSizes.iconMd,
                    color: AppColors.lightTextSub,
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword
                          ? Icons.visibility
                          : Icons.visibility_off,
                      size: AppSizes.iconMd,
                      color: AppColors.lightTextSub,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
              ),
              8.vSpace,
              Row(
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6.0),
                    ),

                    value: isChecked,
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  ),
                  Expanded(
                    child: Text(
                      "I agree to the Terms of Service and Privacy Policy",
                      style: textTheme.bodyMedium!.copyWith(
                        color: AppColors.lightTextSub,
                      ),
                    ),
                  ),
                ],
              ),
              50.vSpace,
              ElevatedButton(onPressed: () {}, child: Text("Sign Up")),
              16.vSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?", style: textTheme.bodyMedium),
                  TextButton(
                    onPressed: () => Navigator.pushReplacementNamed(
                      context,
                      "/signin_screen",
                    ),
                    child: Text(
                      "Login",
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
    );
  }
}
